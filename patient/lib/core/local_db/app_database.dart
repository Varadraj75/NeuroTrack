import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

@DataClassName('PatientDbEntity')
class Patients extends Table {
  TextColumn get patientId => text()();
  TextColumn get patientName => text()();
  IntColumn get age => integer()();
  BoolColumn get isAdult => boolean()();
  TextColumn get phoneNo => text()();
  TextColumn get email => text()();
  TextColumn get guardianName => text().nullable()();
  TextColumn get guardianRelation => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get country => text().nullable()();

  @override
  Set<Column> get primaryKey => {patientId};
}

@DataClassName('TherapistDbEntity')
class Therapists extends Table {
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();
  TextColumn get clinicId => text()();
  BoolColumn get approved => boolean()();
  TextColumn get specialisation => text()();
  TextColumn get gender => text()();
  TextColumn get offeredTherapiesJson => text()(); 
  IntColumn get age => integer()();
  TextColumn get regulatoryBody => text()();
  TextColumn get startAvailabilityTime => text()();
  TextColumn get endAvailabilityTime => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ConsultationRequestDbEntity')
class ConsultationRequests extends Table {
  TextColumn get id => text()();
  TextColumn get patientId => text()();
  TextColumn get therapistId => text()();
  TextColumn get status => text()();
  DateTimeColumn get requestedDttm => dateTime()();
  TextColumn get reason => text().nullable()();
  DateTimeColumn get scheduledDttm => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TherapyDailyActivityDbEntity')
class DailyActivities extends Table {
  TextColumn get id => text()();
  TextColumn get patientId => text()();
  TextColumn get description => text()();
  BoolColumn get isCompleted => boolean()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Patients, Therapists, ConsultationRequests, DailyActivities])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  AppDatabase.forTesting(QueryExecutor connection) : super(connection);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'patient_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

final AppDatabase localDb = AppDatabase();
