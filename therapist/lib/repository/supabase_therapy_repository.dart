import 'package:therapist/core/repository/therapy/therapy_repository.dart';
import 'package:therapist/model/therapy_models/therapy_type_model.dart';
import 'package:therapist/model/therapy_models/therapy_model.dart';
import 'package:therapist/core/result/result.dart';
import 'package:therapist/core/entities/therapy_entities/therapy_goal_entity.dart';
import 'package:therapist/core/entities/daily_activity_entities/daily_activity_response.dart';
import 'package:therapist/core/local_db/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';

class SupabaseTherapyRepository implements TherapyRepository {
  SupabaseTherapyRepository({dynamic supabaseClient});

  @override
  Future<ActionResult> getTherapyTypes() async => ActionResultSuccess(data: <TherapyTypeModel>[], statusCode: 200);

  @override
  Future<ActionResult> addTherapyGoals(String therapyTypeId, String goal) async => ActionResultSuccess(data: null, statusCode: 200);

  @override
  Future<ActionResult> addTherapyObservations(String therapyTypeId, String observation) async => ActionResultSuccess(data: null, statusCode: 200);

  @override
  Future<ActionResult> addTherapyRegressions(String therapyTypeId, String regression) async => ActionResultSuccess(data: null, statusCode: 200);

  @override
  Future<ActionResult> addTherapyActivities(String therapyTypeId, String activity) async => ActionResultSuccess(data: null, statusCode: 200);

  @override
  Future<ActionResult> getAllGoals(String therapyTypeId) async {
    try {
      final data = await localDb.select(localDb.therapyGoals).get();
      return ActionResultSuccess(data: <TherapyModel>[], statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getAllObservations(String therapyTypeId) async => ActionResultSuccess(data: <TherapyModel>[], statusCode: 200);

  @override
  Future<ActionResult> getAllRegressions(String therapyTypeId) async => ActionResultSuccess(data: <TherapyModel>[], statusCode: 200);

  @override
  Future<ActionResult> getAllActivities(String therapyTypeId) async => ActionResultSuccess(data: <TherapyModel>[], statusCode: 200);

  @override
  Future<ActionResult> saveTherapyGoals(TherapyGoalEntity entity) async {
    try {
      await localDb.into(localDb.therapyGoals).insert(
        TherapyGoalsCompanion.insert(
          id: const Uuid().v4(),
          patientId: entity.patientId ?? '',
          description: 'Mock text', 
          status: 'active',
        ),
      );
      return ActionResultSuccess(data: null, statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getAllDailyActivities(String patientId) async => ActionResultSuccess(data: <DailyActivityResponse>[], statusCode: 200);

  @override
  Future<ActionResult> addOrUpdateDailyActivity(DailyActivityResponse dailyActivity) async => ActionResultSuccess(data: null, statusCode: 200);

  @override
  Future<ActionResult> deleteDailyActivity(String activitySetId) async => ActionResultSuccess(data: null, statusCode: 200);
}
