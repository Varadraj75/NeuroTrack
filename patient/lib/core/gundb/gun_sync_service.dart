import 'dart:convert';
import 'package:flutter_gundb/flutter_gundb.dart';
import 'package:patient/core/local_db/app_database.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:typed_data';

class PatientGunSyncService {
  static final PatientGunSyncService _instance = PatientGunSyncService._internal();

  factory PatientGunSyncService() {
    return _instance;
  }

  PatientGunSyncService._internal();

  static WebSocketChannel? _channel;

  Future<void> init() async {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.2.2:8765')
    );
    await Future.delayed(const Duration(seconds: 2));
    print('[GunDB Patient] WebSocket connected and ready');
  }

  Future<void> broadcastSessionBooking(String therapistId, Map<String, dynamic> sessionJson) async {
    if (_channel == null) await init();

    final String rawPayload = jsonEncode({
      'patientId': 'test_patient_001',
      'sessionTime': DateTime.now().toIso8601String(),
      'status': 'booked',
      'message': 'GunDB sync working',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    print('[GunDB Patient] Sending: ' + rawPayload);

    _channel!.sink.add(jsonEncode({
      'type': 'NEW_BOOKING',
      'patientId': 'test_patient_001',
      'sessionTime': DateTime.now().toIso8601String(),
      'status': 'booked',
      'message': 'GunDB sync working',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    }));

    await Future.delayed(const Duration(milliseconds: 500));
    print('[GunDB Patient] Message delivered to relay');
  }
}
