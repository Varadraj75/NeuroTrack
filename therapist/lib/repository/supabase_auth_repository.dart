import 'package:therapist/core/repository/auth/auth_repository.dart';
import 'package:therapist/core/result/result.dart';
import 'package:therapist/core/entities/auth_entities/therapist_personal_info_entity.dart';
import 'package:therapist/core/local_db/app_database.dart';
import 'package:drift/drift.dart' as drift;

class SupabaseAuthRepository implements AuthRepository {
  SupabaseAuthRepository({dynamic supabaseClient});

  @override
  Future<ActionResult> signInWithGoogle() async => ActionResultSuccess(data: 'done', statusCode: 200);

  @override
  Future<ActionResult> storePersonalInfo(TherapistPersonalInfoEntity entity) async {
    try {
      await localDb.into(localDb.therapists).insert(
        TherapistsCompanion.insert(
          id: entity.id,
          createdAt: DateTime.now(),
          name: entity.name,
          email: '',
          phone: '',
          clinicId: '',
          approved: true,
          specialisation: entity.specialization,
          gender: entity.gender,
          offeredTherapiesJson: '[]',
          age: entity.age,
          regulatoryBody: entity.regulatoryBody,
          startAvailabilityTime: entity.startAvailabilityTime,
          endAvailabilityTime: entity.endAvailabilityTime
        ),
        mode: drift.InsertMode.insertOrReplace,
      );
      return ActionResultSuccess(data: 'stored', statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<String?> getUserId() async => "mocked-user-id";

  @override
  Future<ActionResult> checkIfUserIsNew(String userId) async {
    final therapist = await (localDb.select(localDb.therapists)
      ..where((t) => t.id.equals(userId))
      ..limit(1)
    ).getSingleOrNull();

    return ActionResultSuccess(data: {'is_new_user': therapist == null}, statusCode: 200);
  }
}
