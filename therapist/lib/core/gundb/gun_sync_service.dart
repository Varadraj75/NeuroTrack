import 'package:therapist/core/local_db/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'dart:convert';
import 'package:therapist/presentation/widgets/snackbar_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TherapistGunSyncService {
  static final TherapistGunSyncService _instance = TherapistGunSyncService._internal();

  factory TherapistGunSyncService() {
    return _instance;
  }

  TherapistGunSyncService._internal();

  static Function()? onSessionsUpdated;

  Future<void> init() async {
    // Clear the DB to flush past bugged payloads
    await localDb.delete(localDb.sessions).go();
  }

  void listenForNewSessions(String myTherapistId) async {
    try {
      final ws = WebSocketChannel.connect(Uri.parse('ws://10.0.2.2:8765'));

      await Future.delayed(const Duration(seconds: 2));
      print('[Therapist] WebSocket connected and listening');

      ws.stream.listen((message) {
        if (message == null || message.toString().isEmpty) return;
        final msgStr = message.toString();

        print('[Therapist] Raw data received: ' + msgStr);

        try {
          final data = jsonDecode(msgStr);
          if (data is Map && data['type'] == 'NEW_BOOKING') {
             SnackbarService.showSuccess('New Booking from: ' + data['patientId']);
             _insertToDrift(data, myTherapistId);
          }
        } catch (e) {
          // ignore parsing drops
        }
      });
    } catch (e) {
       print('WebSocket bind failed: ' + e.toString());
    }
  }

  Future<void> _insertToDrift(Map actualData, String myTherapistId) async {
      await localDb.into(localDb.sessions).insertOnConflictUpdate(
        SessionsCompanion.insert(
          id: actualData['id']?.toString() ?? 'session_${DateTime.now().millisecondsSinceEpoch}',
          therapistId: myTherapistId,
          patientId: actualData['patientId']?.toString() ?? 'GunDB Test Patient',
          scheduledTime: DateTime.tryParse(actualData['sessionTime']?.toString() ?? '') ?? DateTime.now(),
          status: 'Pending',
          durationMinutes: int.tryParse(actualData['durationMinutes']?.toString() ?? '') ?? 30,
          notes: drift.Value(''),
        ),
      );
      onSessionsUpdated?.call();
  }
}
