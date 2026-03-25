import 'package:patient/core/result/result.dart';
import 'package:patient/presentation/appointments/models/appointment_model.dart';
import 'package:patient/core/entities/entities.dart';
import 'package:patient/core/repository/repository.dart';
import 'package:patient/model/task_model.dart';
import 'package:patient/model/therapy_models/therapy_models.dart';
import 'package:patient/core/local_db/app_database.dart';
import 'package:drift/drift.dart' as drift;

class SupabasePatientRepository implements PatientRepository {
  SupabasePatientRepository({dynamic supabaseClient});

  @override
  Future<ActionResult> scheduleAppointment(PatientScheduleAppointmentEntity entity) async {
     try {
       // Mock the schedule table storing for now to keep interface unbroken
       return ActionResultSuccess(data: 'scheduled', statusCode: 200);
     } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }
  
  @override
  Future<ActionResult> getTherapyGoals({required DateTime date}) async {
    return ActionResultSuccess(data: null, statusCode: 200);
  }

  @override
  Future<ActionResult> fetchAllAppointments() async {
     return ActionResultSuccess(data: <AppointmentModel>[], statusCode: 200);
  }

  @override
  Future<ActionResult> deleteAppointment(String id) async {
    return ActionResultSuccess(data: 'deleted', statusCode: 200);
  }

  @override
  Future<ActionResult> getTodayActivities({DateTime? date}) async {
    try {
      final String safeDate = date?.toIso8601String() ?? '';
      final acts = await localDb.select(localDb.dailyActivities).get();
      return ActionResultSuccess(data: (<PatientTaskModel>[], '', ''), statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> updateActivityCompletion({required List<PatientTaskModel> tasks, String? activityId, String? activitySetId}) async {
     return ActionResultSuccess(data: 'updated', statusCode: 200);
  }

  @override
  Future<ActionResult> getReports({required DateTime date}) async {
    return ActionResultSuccess(data: (<String>[], <String>[], <String>[]), statusCode: 200);
  }
}
