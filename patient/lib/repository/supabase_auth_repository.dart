import 'package:patient/core/entities/auth_entities/auth_entities.dart';
import 'package:patient/core/repository/auth/auth_repository.dart';
import 'package:patient/core/result/result.dart';
import 'package:patient/model/auth_models/auth_model.dart';
import 'package:patient/core/local_db/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository({dynamic supabaseClient});

  static bool hasTakenAssessmentMock = false;
  static bool hasBookedConsultationMock = false;

  @override
  Future<ActionResult> signInWithGoogle() async {
    return ActionResultSuccess(data: 'true', statusCode: 200);
  }

  @override
  Future<ActionResult> storePersonalInfo(PersonalInfoEntity personalInfoEntity) async {
    try {
      await localDb.into(localDb.patients).insert(
        PatientsCompanion.insert(
          patientId: personalInfoEntity.patientId,
          patientName: personalInfoEntity.patientName,
          age: personalInfoEntity.age,
          isAdult: personalInfoEntity.isAdult,
          phoneNo: personalInfoEntity.phoneNo,
          email: personalInfoEntity.email,
          guardianName: drift.Value(personalInfoEntity.guardianName),
          guardianRelation: drift.Value(personalInfoEntity.guardianRelation),
          gender: drift.Value(personalInfoEntity.gender),
          country: drift.Value(personalInfoEntity.country),
        ),
        mode: drift.InsertMode.insertOrReplace,
      );
      return ActionResultSuccess(data: 'stored', statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> checkIfPatientExists() async {
    try {
      final user = await (localDb.select(localDb.patients)..limit(1)).getSingleOrNull();
      return ActionResultSuccess(data: user != null, statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getAllAvailableTherapist() async {
    try {
      final therapists = await localDb.select(localDb.therapists).get();
      
      final mapped = therapists.map((t) => TherapistModel(
         id: t.id,
         createdAt: t.createdAt,
         name: t.name,
         email: t.email,
         phone: t.phone,
         clinicId: t.clinicId,
         approved: t.approved,
         specialisation: t.specialisation,
         gender: t.gender,
         offeredTherapies: <String>[],
         age: t.age,
         regulatoryBody: t.regulatoryBody,
         startAvailabilityTime: t.startAvailabilityTime,
         endAvailabilityTime: t.endAvailabilityTime
      )).toList();

      if (mapped.isEmpty) {
        // Provide a mock therapist if none exist to allow booking 
        mapped.add(TherapistModel(
           id: 'mock-therapist',
           createdAt: DateTime.now(),
           name: 'Dr. John Doe',
           email: 'john@example.com',
           phone: '1234567890',
           clinicId: 'clinic1',
           approved: true,
           specialisation: 'General',
           gender: 'Male',
           offeredTherapies: ['CBT'],
           age: 40,
           regulatoryBody: 'Medical Board',
           startAvailabilityTime: '09:00 AM',
           endAvailabilityTime: '05:00 PM'
        ));
      }

      return ActionResultSuccess(data: mapped, statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getAvailableBookingSlotsForTherapist(
    String therapistId, DateTime date, String startTimeOfTherapist, String endTimeOfTherapist,
  ) async {
    return ActionResultSuccess(data: <String>['10:00 AM', '11:00 AM', '02:00 PM'], statusCode: 200);
  }

  @override
  Future<ActionResult> bookConsultation(ConsultationRequestEntity entity) async {
    try {
      await localDb.into(localDb.consultationRequests).insert(
        ConsultationRequestsCompanion.insert(
          id: const Uuid().v4(),
          patientId: entity.patientId ?? '',
          therapistId: entity.therapistId ?? '',
          status: entity.status ?? 'pending',
          requestedDttm: DateTime.tryParse(entity.timestamp ?? '') ?? DateTime.now(),
          reason: drift.Value(entity.name), 
          scheduledDttm: const drift.Value(null),
        ),
      );
      hasBookedConsultationMock = true; // Complete the flow!
      return ActionResultSuccess(data: 'booked', statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> checkIfPatientAssessmentExists() async {
    return ActionResultSuccess(data: hasTakenAssessmentMock, statusCode: 200);
  }

  @override
  Future<ActionResult> checkIfPatientConsultationExists() async {
    return ActionResultSuccess(data: hasBookedConsultationMock, statusCode: 200);
  }
}
