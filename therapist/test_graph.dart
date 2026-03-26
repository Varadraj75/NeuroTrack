import 'dart:convert';
import 'package:flutter_gundb/flutter_gundb.dart';
import 'dart:typed_data';

void main() async {
  print("Starting GunDB Dart Link Test...");
  final dummyKey = Uint8List.fromList(List.generate(32, (i) => i));
  await initializeFlutterGun(encryptionKeyUint8List: dummyKey, key: 'test_gundb_vault_2');
  
  final options = FlutterGunOptions();
  options.peers = ['ws://127.0.0.1:8765/gun'];
  
  final _gunClient = FlutterGunSeaClient(
    registerStorage: true,
    flutterGunOptions: options,
  );
  
  print("Waiting for network resolve...");
  
  _gunClient.get('therapist_sessions_user123').on((sessionData, [b, c]) {
    print("PARENT TRIGGERED: $sessionData");
    if (sessionData == null || sessionData is! Map) return;
    
    final potentialKeys = (sessionData as Map<dynamic, dynamic>).keys.where((k) => k != '_'); 
    for (var key in potentialKeys) {
        final val = sessionData[key];
        print("Key $key = $val");
        if (val is Map && val['#'] != null) {
            String soul = val['#'];
            _gunClient.get(soul).once((actualData, [b, c]) {
                print("CHILD RESOLVED FOR $soul: $actualData");
            });
        }
    }
  });
  
  await Future.delayed(Duration(seconds: 10));
  print("Test Script Complete.");
}
