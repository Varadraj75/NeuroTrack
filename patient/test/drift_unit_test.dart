import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patient/core/local_db/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('can insert and retrieve patient', () async {
    final patient = PatientsCompanion.insert(
      patientId: '123',
      patientName: 'Test Patient',
      age: 25,
      isAdult: true,
      phoneNo: '1234567890',
      email: 'test@test.com',
    );

    await database.into(database.patients).insert(patient);

    final result = await database.select(database.patients).get();
    expect(result.length, 1);
    expect(result.first.patientName, 'Test Patient');
  });
}
