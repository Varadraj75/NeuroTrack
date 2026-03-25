import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:therapist/core/local_db/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('can insert and retrieve therapist', () async {
    final therapist = TherapistsCompanion.insert(
      id: 'therapist_1',
      createdAt: DateTime.now(),
      name: 'Dr. John Doe',
      email: 'john.doe@test.com',
      phone: '1234567890',
      clinicId: 'clinic_1',
      approved: true,
      specialisation: 'Psychology',
      gender: 'Male',
      offeredTherapiesJson: '[]',
      age: 45,
      regulatoryBody: 'Board',
      startAvailabilityTime: '09:00',
      endAvailabilityTime: '17:00'
    );

    await database.into(database.therapists).insert(therapist);

    final result = await database.select(database.therapists).get();
    expect(result.length, 1);
    expect(result.first.name, 'Dr. John Doe');
  });
}
