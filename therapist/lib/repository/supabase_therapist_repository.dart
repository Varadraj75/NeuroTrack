import 'package:therapist/model/therapist_models/therapist_patient_details_model.dart';
import 'package:therapist/core/repository/therapist/therapist_repository.dart';
import 'package:therapist/core/result/result.dart';
import 'package:therapist/core/local_db/app_database.dart';
import 'package:therapist/model/therapist_models/therapist_schedule_model.dart';
import 'package:therapist/core/models/profession_model.dart';
import 'package:therapist/model/therapy_models/therapy_type_model.dart';
import 'package:drift/drift.dart' as drift;

class SupabaseTherapistRepository implements TherapistRepository {
  SupabaseTherapistRepository({dynamic supabaseClient});

  @override
  Future<ActionResult> getTherapistPatients() async {
    try {
      final data = await localDb.select(localDb.patients).get();
      return ActionResultSuccess(data: <TherapistPatientDetailsModel>[], statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getTherapistSchedule() async {
    try {
      final sessions = await localDb.select(localDb.sessions).get();
      return ActionResultSuccess(data: <TherapistScheduleModel>[], statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getTherapistUpcomingAppointments() async => ActionResultSuccess(data: <TherapistScheduleModel>[], statusCode: 200);

  @override
  Future<ActionResult> changeAppointmentStatus(String appointmentId, String status) async {
    try {
      await (localDb.update(localDb.sessions)
        ..where((s) => s.id.equals(appointmentId))
      ).write(
        SessionsCompanion(status: drift.Value(status)),
      );
      return ActionResultSuccess(data: null, statusCode: 200);
    } catch (e) {
       return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getTherapistSessions() async => ActionResultSuccess(data: <TherapistScheduleModel>[], statusCode: 200);

  @override
  Future<ActionResult> getTotalPatients() async {
    final count = await localDb.patients.count().getSingle();
    return ActionResultSuccess(data: count, statusCode: 200);
  }

  @override
  Future<ActionResult> getTotalSessions() async {
    final count = await localDb.sessions.count().getSingle();
    return ActionResultSuccess(data: count, statusCode: 200);
  }

  @override
  Future<ActionResult> getTotalTherapies() async => ActionResultSuccess(data: 0, statusCode: 200);

  @override
  Future<ActionResult> fetchProfessions() async => ActionResultSuccess(data: <ProfessionModel>[], statusCode: 200);

  @override
  Future<ActionResult> fetchRegulatoryBodies(int professionId) async => ActionResultSuccess(data: <RegulatoryBodyModel>[], statusCode: 200);

  @override
  Future<ActionResult> fetchSpecializations(int professionId) async => ActionResultSuccess(data: <SpecializationModel>[], statusCode: 200);

  @override
  Future<ActionResult> fetchTherapies(int professionId) async => ActionResultSuccess(data: <TherapyTypeModel>[], statusCode: 200);

  @override
  Future<ActionResult> fetchPatientsMappedToTherapist() async {
    try {
      // 1. Insert a mock patient to ensure drift works locally
      await localDb.into(localDb.patients).insertOnConflictUpdate(
        PatientsCompanion.insert(
          patientId: 'drift-test-id',
          patientName: 'Local Drift Patient',
          age: 30,
          isAdult: true,
          phoneNo: '+1234567890',
          email: 'drift@test.com',
        ),
      );

      // 2. Query it back
      final localData = await localDb.select(localDb.patients).get();

      // 3. Map to TherapistPatientDetailsModel
      final mapped = localData.map((e) => TherapistPatientDetailsModel(
        patientId: e.patientId,
        patientName: e.patientName,
        phoneNo: e.phoneNo,
        email: e.email,
      )).toList();

      return ActionResultSuccess(data: mapped, statusCode: 200);
    } catch(e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }
}
