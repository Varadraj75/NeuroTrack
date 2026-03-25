import 'package:therapist/core/repository/consultation/consultation_repository.dart';
import 'package:therapist/core/result/result.dart';
import 'package:therapist/core/local_db/app_database.dart';
import 'package:drift/drift.dart' as drift;

import 'package:therapist/model/consultation/consultation_request_model.dart';

class SupabaseConsultationRepository implements ConsultationRepository {
  SupabaseConsultationRepository({dynamic supabaseClient});

  @override
  Future<ActionResult> fetchConsultationRequests() async {
    try {
      final reqs = await localDb.select(localDb.consultationRequests).get();
      // map to generic entity later, empty for now to avoid breaking UI logic expecting models
      return ActionResultSuccess(data: <ConsultationRequestModel>[], statusCode: 200);
    } catch (e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }

  @override
  Future<ActionResult> getConsultationRequestById(String requestId) async {
    final req = await (localDb.select(localDb.consultationRequests)
      ..where((r) => r.id.equals(requestId))
      ..limit(1)
    ).getSingleOrNull();
    return ActionResultSuccess(data: req, statusCode: 200);
  }

  @override
  Future<ActionResult> updateRequestStatus({
    required String requestId,
    required String status,
    String? reason,
    DateTime? scheduledTime,
    String? notes,
  }) async {
    try {
      await (localDb.update(localDb.consultationRequests)
        ..where((r) => r.id.equals(requestId))
      ).write(
        ConsultationRequestsCompanion(
          status: drift.Value(status),
          reason: drift.Value(reason),
          scheduledDttm: drift.Value(scheduledTime),
        ),
      );
      return ActionResultSuccess(data: 'updated', statusCode: 200);
    } catch(e) {
      return ActionResultFailure(errorMessage: e.toString(), statusCode: 500);
    }
  }
}
