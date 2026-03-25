// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients
    with TableInfo<$PatientsTable, PatientDbEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _patientNameMeta =
      const VerificationMeta('patientName');
  @override
  late final GeneratedColumn<String> patientName = GeneratedColumn<String>(
      'patient_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isAdultMeta =
      const VerificationMeta('isAdult');
  @override
  late final GeneratedColumn<bool> isAdult = GeneratedColumn<bool>(
      'is_adult', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_adult" IN (0, 1))'));
  static const VerificationMeta _phoneNoMeta =
      const VerificationMeta('phoneNo');
  @override
  late final GeneratedColumn<String> phoneNo = GeneratedColumn<String>(
      'phone_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guardianNameMeta =
      const VerificationMeta('guardianName');
  @override
  late final GeneratedColumn<String> guardianName = GeneratedColumn<String>(
      'guardian_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _guardianRelationMeta =
      const VerificationMeta('guardianRelation');
  @override
  late final GeneratedColumn<String> guardianRelation = GeneratedColumn<String>(
      'guardian_relation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        patientId,
        patientName,
        age,
        isAdult,
        phoneNo,
        email,
        guardianName,
        guardianRelation,
        gender,
        country
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<PatientDbEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('patient_name')) {
      context.handle(
          _patientNameMeta,
          patientName.isAcceptableOrUnknown(
              data['patient_name']!, _patientNameMeta));
    } else if (isInserting) {
      context.missing(_patientNameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('is_adult')) {
      context.handle(_isAdultMeta,
          isAdult.isAcceptableOrUnknown(data['is_adult']!, _isAdultMeta));
    } else if (isInserting) {
      context.missing(_isAdultMeta);
    }
    if (data.containsKey('phone_no')) {
      context.handle(_phoneNoMeta,
          phoneNo.isAcceptableOrUnknown(data['phone_no']!, _phoneNoMeta));
    } else if (isInserting) {
      context.missing(_phoneNoMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('guardian_name')) {
      context.handle(
          _guardianNameMeta,
          guardianName.isAcceptableOrUnknown(
              data['guardian_name']!, _guardianNameMeta));
    }
    if (data.containsKey('guardian_relation')) {
      context.handle(
          _guardianRelationMeta,
          guardianRelation.isAcceptableOrUnknown(
              data['guardian_relation']!, _guardianRelationMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {patientId};
  @override
  PatientDbEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PatientDbEntity(
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      patientName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      isAdult: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_adult'])!,
      phoneNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_no'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      guardianName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guardian_name']),
      guardianRelation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}guardian_relation']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class PatientDbEntity extends DataClass implements Insertable<PatientDbEntity> {
  final String patientId;
  final String patientName;
  final int age;
  final bool isAdult;
  final String phoneNo;
  final String email;
  final String? guardianName;
  final String? guardianRelation;
  final String? gender;
  final String? country;
  const PatientDbEntity(
      {required this.patientId,
      required this.patientName,
      required this.age,
      required this.isAdult,
      required this.phoneNo,
      required this.email,
      this.guardianName,
      this.guardianRelation,
      this.gender,
      this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['patient_id'] = Variable<String>(patientId);
    map['patient_name'] = Variable<String>(patientName);
    map['age'] = Variable<int>(age);
    map['is_adult'] = Variable<bool>(isAdult);
    map['phone_no'] = Variable<String>(phoneNo);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || guardianName != null) {
      map['guardian_name'] = Variable<String>(guardianName);
    }
    if (!nullToAbsent || guardianRelation != null) {
      map['guardian_relation'] = Variable<String>(guardianRelation);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      patientId: Value(patientId),
      patientName: Value(patientName),
      age: Value(age),
      isAdult: Value(isAdult),
      phoneNo: Value(phoneNo),
      email: Value(email),
      guardianName: guardianName == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianName),
      guardianRelation: guardianRelation == null && nullToAbsent
          ? const Value.absent()
          : Value(guardianRelation),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
    );
  }

  factory PatientDbEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PatientDbEntity(
      patientId: serializer.fromJson<String>(json['patientId']),
      patientName: serializer.fromJson<String>(json['patientName']),
      age: serializer.fromJson<int>(json['age']),
      isAdult: serializer.fromJson<bool>(json['isAdult']),
      phoneNo: serializer.fromJson<String>(json['phoneNo']),
      email: serializer.fromJson<String>(json['email']),
      guardianName: serializer.fromJson<String?>(json['guardianName']),
      guardianRelation: serializer.fromJson<String?>(json['guardianRelation']),
      gender: serializer.fromJson<String?>(json['gender']),
      country: serializer.fromJson<String?>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'patientId': serializer.toJson<String>(patientId),
      'patientName': serializer.toJson<String>(patientName),
      'age': serializer.toJson<int>(age),
      'isAdult': serializer.toJson<bool>(isAdult),
      'phoneNo': serializer.toJson<String>(phoneNo),
      'email': serializer.toJson<String>(email),
      'guardianName': serializer.toJson<String?>(guardianName),
      'guardianRelation': serializer.toJson<String?>(guardianRelation),
      'gender': serializer.toJson<String?>(gender),
      'country': serializer.toJson<String?>(country),
    };
  }

  PatientDbEntity copyWith(
          {String? patientId,
          String? patientName,
          int? age,
          bool? isAdult,
          String? phoneNo,
          String? email,
          Value<String?> guardianName = const Value.absent(),
          Value<String?> guardianRelation = const Value.absent(),
          Value<String?> gender = const Value.absent(),
          Value<String?> country = const Value.absent()}) =>
      PatientDbEntity(
        patientId: patientId ?? this.patientId,
        patientName: patientName ?? this.patientName,
        age: age ?? this.age,
        isAdult: isAdult ?? this.isAdult,
        phoneNo: phoneNo ?? this.phoneNo,
        email: email ?? this.email,
        guardianName:
            guardianName.present ? guardianName.value : this.guardianName,
        guardianRelation: guardianRelation.present
            ? guardianRelation.value
            : this.guardianRelation,
        gender: gender.present ? gender.value : this.gender,
        country: country.present ? country.value : this.country,
      );
  PatientDbEntity copyWithCompanion(PatientsCompanion data) {
    return PatientDbEntity(
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      patientName:
          data.patientName.present ? data.patientName.value : this.patientName,
      age: data.age.present ? data.age.value : this.age,
      isAdult: data.isAdult.present ? data.isAdult.value : this.isAdult,
      phoneNo: data.phoneNo.present ? data.phoneNo.value : this.phoneNo,
      email: data.email.present ? data.email.value : this.email,
      guardianName: data.guardianName.present
          ? data.guardianName.value
          : this.guardianName,
      guardianRelation: data.guardianRelation.present
          ? data.guardianRelation.value
          : this.guardianRelation,
      gender: data.gender.present ? data.gender.value : this.gender,
      country: data.country.present ? data.country.value : this.country,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PatientDbEntity(')
          ..write('patientId: $patientId, ')
          ..write('patientName: $patientName, ')
          ..write('age: $age, ')
          ..write('isAdult: $isAdult, ')
          ..write('phoneNo: $phoneNo, ')
          ..write('email: $email, ')
          ..write('guardianName: $guardianName, ')
          ..write('guardianRelation: $guardianRelation, ')
          ..write('gender: $gender, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(patientId, patientName, age, isAdult, phoneNo,
      email, guardianName, guardianRelation, gender, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PatientDbEntity &&
          other.patientId == this.patientId &&
          other.patientName == this.patientName &&
          other.age == this.age &&
          other.isAdult == this.isAdult &&
          other.phoneNo == this.phoneNo &&
          other.email == this.email &&
          other.guardianName == this.guardianName &&
          other.guardianRelation == this.guardianRelation &&
          other.gender == this.gender &&
          other.country == this.country);
}

class PatientsCompanion extends UpdateCompanion<PatientDbEntity> {
  final Value<String> patientId;
  final Value<String> patientName;
  final Value<int> age;
  final Value<bool> isAdult;
  final Value<String> phoneNo;
  final Value<String> email;
  final Value<String?> guardianName;
  final Value<String?> guardianRelation;
  final Value<String?> gender;
  final Value<String?> country;
  final Value<int> rowid;
  const PatientsCompanion({
    this.patientId = const Value.absent(),
    this.patientName = const Value.absent(),
    this.age = const Value.absent(),
    this.isAdult = const Value.absent(),
    this.phoneNo = const Value.absent(),
    this.email = const Value.absent(),
    this.guardianName = const Value.absent(),
    this.guardianRelation = const Value.absent(),
    this.gender = const Value.absent(),
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatientsCompanion.insert({
    required String patientId,
    required String patientName,
    required int age,
    required bool isAdult,
    required String phoneNo,
    required String email,
    this.guardianName = const Value.absent(),
    this.guardianRelation = const Value.absent(),
    this.gender = const Value.absent(),
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : patientId = Value(patientId),
        patientName = Value(patientName),
        age = Value(age),
        isAdult = Value(isAdult),
        phoneNo = Value(phoneNo),
        email = Value(email);
  static Insertable<PatientDbEntity> custom({
    Expression<String>? patientId,
    Expression<String>? patientName,
    Expression<int>? age,
    Expression<bool>? isAdult,
    Expression<String>? phoneNo,
    Expression<String>? email,
    Expression<String>? guardianName,
    Expression<String>? guardianRelation,
    Expression<String>? gender,
    Expression<String>? country,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (patientId != null) 'patient_id': patientId,
      if (patientName != null) 'patient_name': patientName,
      if (age != null) 'age': age,
      if (isAdult != null) 'is_adult': isAdult,
      if (phoneNo != null) 'phone_no': phoneNo,
      if (email != null) 'email': email,
      if (guardianName != null) 'guardian_name': guardianName,
      if (guardianRelation != null) 'guardian_relation': guardianRelation,
      if (gender != null) 'gender': gender,
      if (country != null) 'country': country,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatientsCompanion copyWith(
      {Value<String>? patientId,
      Value<String>? patientName,
      Value<int>? age,
      Value<bool>? isAdult,
      Value<String>? phoneNo,
      Value<String>? email,
      Value<String?>? guardianName,
      Value<String?>? guardianRelation,
      Value<String?>? gender,
      Value<String?>? country,
      Value<int>? rowid}) {
    return PatientsCompanion(
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      age: age ?? this.age,
      isAdult: isAdult ?? this.isAdult,
      phoneNo: phoneNo ?? this.phoneNo,
      email: email ?? this.email,
      guardianName: guardianName ?? this.guardianName,
      guardianRelation: guardianRelation ?? this.guardianRelation,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (patientName.present) {
      map['patient_name'] = Variable<String>(patientName.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (isAdult.present) {
      map['is_adult'] = Variable<bool>(isAdult.value);
    }
    if (phoneNo.present) {
      map['phone_no'] = Variable<String>(phoneNo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (guardianName.present) {
      map['guardian_name'] = Variable<String>(guardianName.value);
    }
    if (guardianRelation.present) {
      map['guardian_relation'] = Variable<String>(guardianRelation.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('patientId: $patientId, ')
          ..write('patientName: $patientName, ')
          ..write('age: $age, ')
          ..write('isAdult: $isAdult, ')
          ..write('phoneNo: $phoneNo, ')
          ..write('email: $email, ')
          ..write('guardianName: $guardianName, ')
          ..write('guardianRelation: $guardianRelation, ')
          ..write('gender: $gender, ')
          ..write('country: $country, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TherapistsTable extends Therapists
    with TableInfo<$TherapistsTable, TherapistDbEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TherapistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clinicIdMeta =
      const VerificationMeta('clinicId');
  @override
  late final GeneratedColumn<String> clinicId = GeneratedColumn<String>(
      'clinic_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _approvedMeta =
      const VerificationMeta('approved');
  @override
  late final GeneratedColumn<bool> approved = GeneratedColumn<bool>(
      'approved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("approved" IN (0, 1))'));
  static const VerificationMeta _specialisationMeta =
      const VerificationMeta('specialisation');
  @override
  late final GeneratedColumn<String> specialisation = GeneratedColumn<String>(
      'specialisation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _offeredTherapiesJsonMeta =
      const VerificationMeta('offeredTherapiesJson');
  @override
  late final GeneratedColumn<String> offeredTherapiesJson =
      GeneratedColumn<String>('offered_therapies_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _regulatoryBodyMeta =
      const VerificationMeta('regulatoryBody');
  @override
  late final GeneratedColumn<String> regulatoryBody = GeneratedColumn<String>(
      'regulatory_body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startAvailabilityTimeMeta =
      const VerificationMeta('startAvailabilityTime');
  @override
  late final GeneratedColumn<String> startAvailabilityTime =
      GeneratedColumn<String>('start_availability_time', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endAvailabilityTimeMeta =
      const VerificationMeta('endAvailabilityTime');
  @override
  late final GeneratedColumn<String> endAvailabilityTime =
      GeneratedColumn<String>('end_availability_time', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdAt,
        name,
        email,
        phone,
        clinicId,
        approved,
        specialisation,
        gender,
        offeredTherapiesJson,
        age,
        regulatoryBody,
        startAvailabilityTime,
        endAvailabilityTime
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'therapists';
  @override
  VerificationContext validateIntegrity(Insertable<TherapistDbEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('clinic_id')) {
      context.handle(_clinicIdMeta,
          clinicId.isAcceptableOrUnknown(data['clinic_id']!, _clinicIdMeta));
    } else if (isInserting) {
      context.missing(_clinicIdMeta);
    }
    if (data.containsKey('approved')) {
      context.handle(_approvedMeta,
          approved.isAcceptableOrUnknown(data['approved']!, _approvedMeta));
    } else if (isInserting) {
      context.missing(_approvedMeta);
    }
    if (data.containsKey('specialisation')) {
      context.handle(
          _specialisationMeta,
          specialisation.isAcceptableOrUnknown(
              data['specialisation']!, _specialisationMeta));
    } else if (isInserting) {
      context.missing(_specialisationMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('offered_therapies_json')) {
      context.handle(
          _offeredTherapiesJsonMeta,
          offeredTherapiesJson.isAcceptableOrUnknown(
              data['offered_therapies_json']!, _offeredTherapiesJsonMeta));
    } else if (isInserting) {
      context.missing(_offeredTherapiesJsonMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('regulatory_body')) {
      context.handle(
          _regulatoryBodyMeta,
          regulatoryBody.isAcceptableOrUnknown(
              data['regulatory_body']!, _regulatoryBodyMeta));
    } else if (isInserting) {
      context.missing(_regulatoryBodyMeta);
    }
    if (data.containsKey('start_availability_time')) {
      context.handle(
          _startAvailabilityTimeMeta,
          startAvailabilityTime.isAcceptableOrUnknown(
              data['start_availability_time']!, _startAvailabilityTimeMeta));
    } else if (isInserting) {
      context.missing(_startAvailabilityTimeMeta);
    }
    if (data.containsKey('end_availability_time')) {
      context.handle(
          _endAvailabilityTimeMeta,
          endAvailabilityTime.isAcceptableOrUnknown(
              data['end_availability_time']!, _endAvailabilityTimeMeta));
    } else if (isInserting) {
      context.missing(_endAvailabilityTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TherapistDbEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TherapistDbEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      clinicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clinic_id'])!,
      approved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}approved'])!,
      specialisation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}specialisation'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      offeredTherapiesJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}offered_therapies_json'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      regulatoryBody: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}regulatory_body'])!,
      startAvailabilityTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}start_availability_time'])!,
      endAvailabilityTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}end_availability_time'])!,
    );
  }

  @override
  $TherapistsTable createAlias(String alias) {
    return $TherapistsTable(attachedDatabase, alias);
  }
}

class TherapistDbEntity extends DataClass
    implements Insertable<TherapistDbEntity> {
  final String id;
  final DateTime createdAt;
  final String name;
  final String email;
  final String phone;
  final String clinicId;
  final bool approved;
  final String specialisation;
  final String gender;
  final String offeredTherapiesJson;
  final int age;
  final String regulatoryBody;
  final String startAvailabilityTime;
  final String endAvailabilityTime;
  const TherapistDbEntity(
      {required this.id,
      required this.createdAt,
      required this.name,
      required this.email,
      required this.phone,
      required this.clinicId,
      required this.approved,
      required this.specialisation,
      required this.gender,
      required this.offeredTherapiesJson,
      required this.age,
      required this.regulatoryBody,
      required this.startAvailabilityTime,
      required this.endAvailabilityTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['clinic_id'] = Variable<String>(clinicId);
    map['approved'] = Variable<bool>(approved);
    map['specialisation'] = Variable<String>(specialisation);
    map['gender'] = Variable<String>(gender);
    map['offered_therapies_json'] = Variable<String>(offeredTherapiesJson);
    map['age'] = Variable<int>(age);
    map['regulatory_body'] = Variable<String>(regulatoryBody);
    map['start_availability_time'] = Variable<String>(startAvailabilityTime);
    map['end_availability_time'] = Variable<String>(endAvailabilityTime);
    return map;
  }

  TherapistsCompanion toCompanion(bool nullToAbsent) {
    return TherapistsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      email: Value(email),
      phone: Value(phone),
      clinicId: Value(clinicId),
      approved: Value(approved),
      specialisation: Value(specialisation),
      gender: Value(gender),
      offeredTherapiesJson: Value(offeredTherapiesJson),
      age: Value(age),
      regulatoryBody: Value(regulatoryBody),
      startAvailabilityTime: Value(startAvailabilityTime),
      endAvailabilityTime: Value(endAvailabilityTime),
    );
  }

  factory TherapistDbEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TherapistDbEntity(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      clinicId: serializer.fromJson<String>(json['clinicId']),
      approved: serializer.fromJson<bool>(json['approved']),
      specialisation: serializer.fromJson<String>(json['specialisation']),
      gender: serializer.fromJson<String>(json['gender']),
      offeredTherapiesJson:
          serializer.fromJson<String>(json['offeredTherapiesJson']),
      age: serializer.fromJson<int>(json['age']),
      regulatoryBody: serializer.fromJson<String>(json['regulatoryBody']),
      startAvailabilityTime:
          serializer.fromJson<String>(json['startAvailabilityTime']),
      endAvailabilityTime:
          serializer.fromJson<String>(json['endAvailabilityTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'clinicId': serializer.toJson<String>(clinicId),
      'approved': serializer.toJson<bool>(approved),
      'specialisation': serializer.toJson<String>(specialisation),
      'gender': serializer.toJson<String>(gender),
      'offeredTherapiesJson': serializer.toJson<String>(offeredTherapiesJson),
      'age': serializer.toJson<int>(age),
      'regulatoryBody': serializer.toJson<String>(regulatoryBody),
      'startAvailabilityTime': serializer.toJson<String>(startAvailabilityTime),
      'endAvailabilityTime': serializer.toJson<String>(endAvailabilityTime),
    };
  }

  TherapistDbEntity copyWith(
          {String? id,
          DateTime? createdAt,
          String? name,
          String? email,
          String? phone,
          String? clinicId,
          bool? approved,
          String? specialisation,
          String? gender,
          String? offeredTherapiesJson,
          int? age,
          String? regulatoryBody,
          String? startAvailabilityTime,
          String? endAvailabilityTime}) =>
      TherapistDbEntity(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        clinicId: clinicId ?? this.clinicId,
        approved: approved ?? this.approved,
        specialisation: specialisation ?? this.specialisation,
        gender: gender ?? this.gender,
        offeredTherapiesJson: offeredTherapiesJson ?? this.offeredTherapiesJson,
        age: age ?? this.age,
        regulatoryBody: regulatoryBody ?? this.regulatoryBody,
        startAvailabilityTime:
            startAvailabilityTime ?? this.startAvailabilityTime,
        endAvailabilityTime: endAvailabilityTime ?? this.endAvailabilityTime,
      );
  TherapistDbEntity copyWithCompanion(TherapistsCompanion data) {
    return TherapistDbEntity(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      clinicId: data.clinicId.present ? data.clinicId.value : this.clinicId,
      approved: data.approved.present ? data.approved.value : this.approved,
      specialisation: data.specialisation.present
          ? data.specialisation.value
          : this.specialisation,
      gender: data.gender.present ? data.gender.value : this.gender,
      offeredTherapiesJson: data.offeredTherapiesJson.present
          ? data.offeredTherapiesJson.value
          : this.offeredTherapiesJson,
      age: data.age.present ? data.age.value : this.age,
      regulatoryBody: data.regulatoryBody.present
          ? data.regulatoryBody.value
          : this.regulatoryBody,
      startAvailabilityTime: data.startAvailabilityTime.present
          ? data.startAvailabilityTime.value
          : this.startAvailabilityTime,
      endAvailabilityTime: data.endAvailabilityTime.present
          ? data.endAvailabilityTime.value
          : this.endAvailabilityTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TherapistDbEntity(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('clinicId: $clinicId, ')
          ..write('approved: $approved, ')
          ..write('specialisation: $specialisation, ')
          ..write('gender: $gender, ')
          ..write('offeredTherapiesJson: $offeredTherapiesJson, ')
          ..write('age: $age, ')
          ..write('regulatoryBody: $regulatoryBody, ')
          ..write('startAvailabilityTime: $startAvailabilityTime, ')
          ..write('endAvailabilityTime: $endAvailabilityTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      createdAt,
      name,
      email,
      phone,
      clinicId,
      approved,
      specialisation,
      gender,
      offeredTherapiesJson,
      age,
      regulatoryBody,
      startAvailabilityTime,
      endAvailabilityTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TherapistDbEntity &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.clinicId == this.clinicId &&
          other.approved == this.approved &&
          other.specialisation == this.specialisation &&
          other.gender == this.gender &&
          other.offeredTherapiesJson == this.offeredTherapiesJson &&
          other.age == this.age &&
          other.regulatoryBody == this.regulatoryBody &&
          other.startAvailabilityTime == this.startAvailabilityTime &&
          other.endAvailabilityTime == this.endAvailabilityTime);
}

class TherapistsCompanion extends UpdateCompanion<TherapistDbEntity> {
  final Value<String> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> clinicId;
  final Value<bool> approved;
  final Value<String> specialisation;
  final Value<String> gender;
  final Value<String> offeredTherapiesJson;
  final Value<int> age;
  final Value<String> regulatoryBody;
  final Value<String> startAvailabilityTime;
  final Value<String> endAvailabilityTime;
  final Value<int> rowid;
  const TherapistsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.clinicId = const Value.absent(),
    this.approved = const Value.absent(),
    this.specialisation = const Value.absent(),
    this.gender = const Value.absent(),
    this.offeredTherapiesJson = const Value.absent(),
    this.age = const Value.absent(),
    this.regulatoryBody = const Value.absent(),
    this.startAvailabilityTime = const Value.absent(),
    this.endAvailabilityTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TherapistsCompanion.insert({
    required String id,
    required DateTime createdAt,
    required String name,
    required String email,
    required String phone,
    required String clinicId,
    required bool approved,
    required String specialisation,
    required String gender,
    required String offeredTherapiesJson,
    required int age,
    required String regulatoryBody,
    required String startAvailabilityTime,
    required String endAvailabilityTime,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdAt = Value(createdAt),
        name = Value(name),
        email = Value(email),
        phone = Value(phone),
        clinicId = Value(clinicId),
        approved = Value(approved),
        specialisation = Value(specialisation),
        gender = Value(gender),
        offeredTherapiesJson = Value(offeredTherapiesJson),
        age = Value(age),
        regulatoryBody = Value(regulatoryBody),
        startAvailabilityTime = Value(startAvailabilityTime),
        endAvailabilityTime = Value(endAvailabilityTime);
  static Insertable<TherapistDbEntity> custom({
    Expression<String>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? clinicId,
    Expression<bool>? approved,
    Expression<String>? specialisation,
    Expression<String>? gender,
    Expression<String>? offeredTherapiesJson,
    Expression<int>? age,
    Expression<String>? regulatoryBody,
    Expression<String>? startAvailabilityTime,
    Expression<String>? endAvailabilityTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (clinicId != null) 'clinic_id': clinicId,
      if (approved != null) 'approved': approved,
      if (specialisation != null) 'specialisation': specialisation,
      if (gender != null) 'gender': gender,
      if (offeredTherapiesJson != null)
        'offered_therapies_json': offeredTherapiesJson,
      if (age != null) 'age': age,
      if (regulatoryBody != null) 'regulatory_body': regulatoryBody,
      if (startAvailabilityTime != null)
        'start_availability_time': startAvailabilityTime,
      if (endAvailabilityTime != null)
        'end_availability_time': endAvailabilityTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TherapistsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdAt,
      Value<String>? name,
      Value<String>? email,
      Value<String>? phone,
      Value<String>? clinicId,
      Value<bool>? approved,
      Value<String>? specialisation,
      Value<String>? gender,
      Value<String>? offeredTherapiesJson,
      Value<int>? age,
      Value<String>? regulatoryBody,
      Value<String>? startAvailabilityTime,
      Value<String>? endAvailabilityTime,
      Value<int>? rowid}) {
    return TherapistsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      clinicId: clinicId ?? this.clinicId,
      approved: approved ?? this.approved,
      specialisation: specialisation ?? this.specialisation,
      gender: gender ?? this.gender,
      offeredTherapiesJson: offeredTherapiesJson ?? this.offeredTherapiesJson,
      age: age ?? this.age,
      regulatoryBody: regulatoryBody ?? this.regulatoryBody,
      startAvailabilityTime:
          startAvailabilityTime ?? this.startAvailabilityTime,
      endAvailabilityTime: endAvailabilityTime ?? this.endAvailabilityTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (clinicId.present) {
      map['clinic_id'] = Variable<String>(clinicId.value);
    }
    if (approved.present) {
      map['approved'] = Variable<bool>(approved.value);
    }
    if (specialisation.present) {
      map['specialisation'] = Variable<String>(specialisation.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (offeredTherapiesJson.present) {
      map['offered_therapies_json'] =
          Variable<String>(offeredTherapiesJson.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (regulatoryBody.present) {
      map['regulatory_body'] = Variable<String>(regulatoryBody.value);
    }
    if (startAvailabilityTime.present) {
      map['start_availability_time'] =
          Variable<String>(startAvailabilityTime.value);
    }
    if (endAvailabilityTime.present) {
      map['end_availability_time'] =
          Variable<String>(endAvailabilityTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TherapistsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('clinicId: $clinicId, ')
          ..write('approved: $approved, ')
          ..write('specialisation: $specialisation, ')
          ..write('gender: $gender, ')
          ..write('offeredTherapiesJson: $offeredTherapiesJson, ')
          ..write('age: $age, ')
          ..write('regulatoryBody: $regulatoryBody, ')
          ..write('startAvailabilityTime: $startAvailabilityTime, ')
          ..write('endAvailabilityTime: $endAvailabilityTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ConsultationRequestsTable extends ConsultationRequests
    with TableInfo<$ConsultationRequestsTable, ConsultationRequestDbEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConsultationRequestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _therapistIdMeta =
      const VerificationMeta('therapistId');
  @override
  late final GeneratedColumn<String> therapistId = GeneratedColumn<String>(
      'therapist_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requestedDttmMeta =
      const VerificationMeta('requestedDttm');
  @override
  late final GeneratedColumn<DateTime> requestedDttm =
      GeneratedColumn<DateTime>('requested_dttm', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _scheduledDttmMeta =
      const VerificationMeta('scheduledDttm');
  @override
  late final GeneratedColumn<DateTime> scheduledDttm =
      GeneratedColumn<DateTime>('scheduled_dttm', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        therapistId,
        status,
        requestedDttm,
        reason,
        scheduledDttm
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consultation_requests';
  @override
  VerificationContext validateIntegrity(
      Insertable<ConsultationRequestDbEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('therapist_id')) {
      context.handle(
          _therapistIdMeta,
          therapistId.isAcceptableOrUnknown(
              data['therapist_id']!, _therapistIdMeta));
    } else if (isInserting) {
      context.missing(_therapistIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('requested_dttm')) {
      context.handle(
          _requestedDttmMeta,
          requestedDttm.isAcceptableOrUnknown(
              data['requested_dttm']!, _requestedDttmMeta));
    } else if (isInserting) {
      context.missing(_requestedDttmMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    }
    if (data.containsKey('scheduled_dttm')) {
      context.handle(
          _scheduledDttmMeta,
          scheduledDttm.isAcceptableOrUnknown(
              data['scheduled_dttm']!, _scheduledDttmMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConsultationRequestDbEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConsultationRequestDbEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      therapistId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}therapist_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      requestedDttm: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}requested_dttm'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason']),
      scheduledDttm: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}scheduled_dttm']),
    );
  }

  @override
  $ConsultationRequestsTable createAlias(String alias) {
    return $ConsultationRequestsTable(attachedDatabase, alias);
  }
}

class ConsultationRequestDbEntity extends DataClass
    implements Insertable<ConsultationRequestDbEntity> {
  final String id;
  final String patientId;
  final String therapistId;
  final String status;
  final DateTime requestedDttm;
  final String? reason;
  final DateTime? scheduledDttm;
  const ConsultationRequestDbEntity(
      {required this.id,
      required this.patientId,
      required this.therapistId,
      required this.status,
      required this.requestedDttm,
      this.reason,
      this.scheduledDttm});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['therapist_id'] = Variable<String>(therapistId);
    map['status'] = Variable<String>(status);
    map['requested_dttm'] = Variable<DateTime>(requestedDttm);
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    if (!nullToAbsent || scheduledDttm != null) {
      map['scheduled_dttm'] = Variable<DateTime>(scheduledDttm);
    }
    return map;
  }

  ConsultationRequestsCompanion toCompanion(bool nullToAbsent) {
    return ConsultationRequestsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      therapistId: Value(therapistId),
      status: Value(status),
      requestedDttm: Value(requestedDttm),
      reason:
          reason == null && nullToAbsent ? const Value.absent() : Value(reason),
      scheduledDttm: scheduledDttm == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledDttm),
    );
  }

  factory ConsultationRequestDbEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConsultationRequestDbEntity(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      therapistId: serializer.fromJson<String>(json['therapistId']),
      status: serializer.fromJson<String>(json['status']),
      requestedDttm: serializer.fromJson<DateTime>(json['requestedDttm']),
      reason: serializer.fromJson<String?>(json['reason']),
      scheduledDttm: serializer.fromJson<DateTime?>(json['scheduledDttm']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'therapistId': serializer.toJson<String>(therapistId),
      'status': serializer.toJson<String>(status),
      'requestedDttm': serializer.toJson<DateTime>(requestedDttm),
      'reason': serializer.toJson<String?>(reason),
      'scheduledDttm': serializer.toJson<DateTime?>(scheduledDttm),
    };
  }

  ConsultationRequestDbEntity copyWith(
          {String? id,
          String? patientId,
          String? therapistId,
          String? status,
          DateTime? requestedDttm,
          Value<String?> reason = const Value.absent(),
          Value<DateTime?> scheduledDttm = const Value.absent()}) =>
      ConsultationRequestDbEntity(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        therapistId: therapistId ?? this.therapistId,
        status: status ?? this.status,
        requestedDttm: requestedDttm ?? this.requestedDttm,
        reason: reason.present ? reason.value : this.reason,
        scheduledDttm:
            scheduledDttm.present ? scheduledDttm.value : this.scheduledDttm,
      );
  ConsultationRequestDbEntity copyWithCompanion(
      ConsultationRequestsCompanion data) {
    return ConsultationRequestDbEntity(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      therapistId:
          data.therapistId.present ? data.therapistId.value : this.therapistId,
      status: data.status.present ? data.status.value : this.status,
      requestedDttm: data.requestedDttm.present
          ? data.requestedDttm.value
          : this.requestedDttm,
      reason: data.reason.present ? data.reason.value : this.reason,
      scheduledDttm: data.scheduledDttm.present
          ? data.scheduledDttm.value
          : this.scheduledDttm,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConsultationRequestDbEntity(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('therapistId: $therapistId, ')
          ..write('status: $status, ')
          ..write('requestedDttm: $requestedDttm, ')
          ..write('reason: $reason, ')
          ..write('scheduledDttm: $scheduledDttm')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, patientId, therapistId, status, requestedDttm, reason, scheduledDttm);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConsultationRequestDbEntity &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.therapistId == this.therapistId &&
          other.status == this.status &&
          other.requestedDttm == this.requestedDttm &&
          other.reason == this.reason &&
          other.scheduledDttm == this.scheduledDttm);
}

class ConsultationRequestsCompanion
    extends UpdateCompanion<ConsultationRequestDbEntity> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<String> therapistId;
  final Value<String> status;
  final Value<DateTime> requestedDttm;
  final Value<String?> reason;
  final Value<DateTime?> scheduledDttm;
  final Value<int> rowid;
  const ConsultationRequestsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.therapistId = const Value.absent(),
    this.status = const Value.absent(),
    this.requestedDttm = const Value.absent(),
    this.reason = const Value.absent(),
    this.scheduledDttm = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConsultationRequestsCompanion.insert({
    required String id,
    required String patientId,
    required String therapistId,
    required String status,
    required DateTime requestedDttm,
    this.reason = const Value.absent(),
    this.scheduledDttm = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        therapistId = Value(therapistId),
        status = Value(status),
        requestedDttm = Value(requestedDttm);
  static Insertable<ConsultationRequestDbEntity> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<String>? therapistId,
    Expression<String>? status,
    Expression<DateTime>? requestedDttm,
    Expression<String>? reason,
    Expression<DateTime>? scheduledDttm,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (therapistId != null) 'therapist_id': therapistId,
      if (status != null) 'status': status,
      if (requestedDttm != null) 'requested_dttm': requestedDttm,
      if (reason != null) 'reason': reason,
      if (scheduledDttm != null) 'scheduled_dttm': scheduledDttm,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConsultationRequestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<String>? therapistId,
      Value<String>? status,
      Value<DateTime>? requestedDttm,
      Value<String?>? reason,
      Value<DateTime?>? scheduledDttm,
      Value<int>? rowid}) {
    return ConsultationRequestsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      therapistId: therapistId ?? this.therapistId,
      status: status ?? this.status,
      requestedDttm: requestedDttm ?? this.requestedDttm,
      reason: reason ?? this.reason,
      scheduledDttm: scheduledDttm ?? this.scheduledDttm,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (therapistId.present) {
      map['therapist_id'] = Variable<String>(therapistId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (requestedDttm.present) {
      map['requested_dttm'] = Variable<DateTime>(requestedDttm.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (scheduledDttm.present) {
      map['scheduled_dttm'] = Variable<DateTime>(scheduledDttm.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsultationRequestsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('therapistId: $therapistId, ')
          ..write('status: $status, ')
          ..write('requestedDttm: $requestedDttm, ')
          ..write('reason: $reason, ')
          ..write('scheduledDttm: $scheduledDttm, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyActivitiesTable extends DailyActivities
    with TableInfo<$DailyActivitiesTable, TherapyDailyActivityDbEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, patientId, description, isCompleted, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_activities';
  @override
  VerificationContext validateIntegrity(
      Insertable<TherapyDailyActivityDbEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TherapyDailyActivityDbEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TherapyDailyActivityDbEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $DailyActivitiesTable createAlias(String alias) {
    return $DailyActivitiesTable(attachedDatabase, alias);
  }
}

class TherapyDailyActivityDbEntity extends DataClass
    implements Insertable<TherapyDailyActivityDbEntity> {
  final String id;
  final String patientId;
  final String description;
  final bool isCompleted;
  final DateTime date;
  const TherapyDailyActivityDbEntity(
      {required this.id,
      required this.patientId,
      required this.description,
      required this.isCompleted,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['description'] = Variable<String>(description);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  DailyActivitiesCompanion toCompanion(bool nullToAbsent) {
    return DailyActivitiesCompanion(
      id: Value(id),
      patientId: Value(patientId),
      description: Value(description),
      isCompleted: Value(isCompleted),
      date: Value(date),
    );
  }

  factory TherapyDailyActivityDbEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TherapyDailyActivityDbEntity(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      description: serializer.fromJson<String>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'description': serializer.toJson<String>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  TherapyDailyActivityDbEntity copyWith(
          {String? id,
          String? patientId,
          String? description,
          bool? isCompleted,
          DateTime? date}) =>
      TherapyDailyActivityDbEntity(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        date: date ?? this.date,
      );
  TherapyDailyActivityDbEntity copyWithCompanion(
      DailyActivitiesCompanion data) {
    return TherapyDailyActivityDbEntity(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      description:
          data.description.present ? data.description.value : this.description,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TherapyDailyActivityDbEntity(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, patientId, description, isCompleted, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TherapyDailyActivityDbEntity &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.date == this.date);
}

class DailyActivitiesCompanion
    extends UpdateCompanion<TherapyDailyActivityDbEntity> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<String> description;
  final Value<bool> isCompleted;
  final Value<DateTime> date;
  final Value<int> rowid;
  const DailyActivitiesCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyActivitiesCompanion.insert({
    required String id,
    required String patientId,
    required String description,
    required bool isCompleted,
    required DateTime date,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        description = Value(description),
        isCompleted = Value(isCompleted),
        date = Value(date);
  static Insertable<TherapyDailyActivityDbEntity> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<String>? description,
    Expression<bool>? isCompleted,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyActivitiesCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<String>? description,
      Value<bool>? isCompleted,
      Value<DateTime>? date,
      Value<int>? rowid}) {
    return DailyActivitiesCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyActivitiesCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $TherapistsTable therapists = $TherapistsTable(this);
  late final $ConsultationRequestsTable consultationRequests =
      $ConsultationRequestsTable(this);
  late final $DailyActivitiesTable dailyActivities =
      $DailyActivitiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [patients, therapists, consultationRequests, dailyActivities];
}

typedef $$PatientsTableCreateCompanionBuilder = PatientsCompanion Function({
  required String patientId,
  required String patientName,
  required int age,
  required bool isAdult,
  required String phoneNo,
  required String email,
  Value<String?> guardianName,
  Value<String?> guardianRelation,
  Value<String?> gender,
  Value<String?> country,
  Value<int> rowid,
});
typedef $$PatientsTableUpdateCompanionBuilder = PatientsCompanion Function({
  Value<String> patientId,
  Value<String> patientName,
  Value<int> age,
  Value<bool> isAdult,
  Value<String> phoneNo,
  Value<String> email,
  Value<String?> guardianName,
  Value<String?> guardianRelation,
  Value<String?> gender,
  Value<String?> country,
  Value<int> rowid,
});

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get patientName => $composableBuilder(
      column: $table.patientName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAdult => $composableBuilder(
      column: $table.isAdult, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNo => $composableBuilder(
      column: $table.phoneNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianName => $composableBuilder(
      column: $table.guardianName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get guardianRelation => $composableBuilder(
      column: $table.guardianRelation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get patientName => $composableBuilder(
      column: $table.patientName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAdult => $composableBuilder(
      column: $table.isAdult, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNo => $composableBuilder(
      column: $table.phoneNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianName => $composableBuilder(
      column: $table.guardianName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get guardianRelation => $composableBuilder(
      column: $table.guardianRelation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get patientName => $composableBuilder(
      column: $table.patientName, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<bool> get isAdult =>
      $composableBuilder(column: $table.isAdult, builder: (column) => column);

  GeneratedColumn<String> get phoneNo =>
      $composableBuilder(column: $table.phoneNo, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get guardianName => $composableBuilder(
      column: $table.guardianName, builder: (column) => column);

  GeneratedColumn<String> get guardianRelation => $composableBuilder(
      column: $table.guardianRelation, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);
}

class $$PatientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PatientsTable,
    PatientDbEntity,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (
      PatientDbEntity,
      BaseReferences<_$AppDatabase, $PatientsTable, PatientDbEntity>
    ),
    PatientDbEntity,
    PrefetchHooks Function()> {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> patientId = const Value.absent(),
            Value<String> patientName = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<bool> isAdult = const Value.absent(),
            Value<String> phoneNo = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String?> guardianName = const Value.absent(),
            Value<String?> guardianRelation = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion(
            patientId: patientId,
            patientName: patientName,
            age: age,
            isAdult: isAdult,
            phoneNo: phoneNo,
            email: email,
            guardianName: guardianName,
            guardianRelation: guardianRelation,
            gender: gender,
            country: country,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String patientId,
            required String patientName,
            required int age,
            required bool isAdult,
            required String phoneNo,
            required String email,
            Value<String?> guardianName = const Value.absent(),
            Value<String?> guardianRelation = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> country = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion.insert(
            patientId: patientId,
            patientName: patientName,
            age: age,
            isAdult: isAdult,
            phoneNo: phoneNo,
            email: email,
            guardianName: guardianName,
            guardianRelation: guardianRelation,
            gender: gender,
            country: country,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PatientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PatientsTable,
    PatientDbEntity,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (
      PatientDbEntity,
      BaseReferences<_$AppDatabase, $PatientsTable, PatientDbEntity>
    ),
    PatientDbEntity,
    PrefetchHooks Function()>;
typedef $$TherapistsTableCreateCompanionBuilder = TherapistsCompanion Function({
  required String id,
  required DateTime createdAt,
  required String name,
  required String email,
  required String phone,
  required String clinicId,
  required bool approved,
  required String specialisation,
  required String gender,
  required String offeredTherapiesJson,
  required int age,
  required String regulatoryBody,
  required String startAvailabilityTime,
  required String endAvailabilityTime,
  Value<int> rowid,
});
typedef $$TherapistsTableUpdateCompanionBuilder = TherapistsCompanion Function({
  Value<String> id,
  Value<DateTime> createdAt,
  Value<String> name,
  Value<String> email,
  Value<String> phone,
  Value<String> clinicId,
  Value<bool> approved,
  Value<String> specialisation,
  Value<String> gender,
  Value<String> offeredTherapiesJson,
  Value<int> age,
  Value<String> regulatoryBody,
  Value<String> startAvailabilityTime,
  Value<String> endAvailabilityTime,
  Value<int> rowid,
});

class $$TherapistsTableFilterComposer
    extends Composer<_$AppDatabase, $TherapistsTable> {
  $$TherapistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clinicId => $composableBuilder(
      column: $table.clinicId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get approved => $composableBuilder(
      column: $table.approved, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get specialisation => $composableBuilder(
      column: $table.specialisation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get offeredTherapiesJson => $composableBuilder(
      column: $table.offeredTherapiesJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get regulatoryBody => $composableBuilder(
      column: $table.regulatoryBody,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startAvailabilityTime => $composableBuilder(
      column: $table.startAvailabilityTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endAvailabilityTime => $composableBuilder(
      column: $table.endAvailabilityTime,
      builder: (column) => ColumnFilters(column));
}

class $$TherapistsTableOrderingComposer
    extends Composer<_$AppDatabase, $TherapistsTable> {
  $$TherapistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clinicId => $composableBuilder(
      column: $table.clinicId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get approved => $composableBuilder(
      column: $table.approved, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get specialisation => $composableBuilder(
      column: $table.specialisation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get offeredTherapiesJson => $composableBuilder(
      column: $table.offeredTherapiesJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get regulatoryBody => $composableBuilder(
      column: $table.regulatoryBody,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startAvailabilityTime => $composableBuilder(
      column: $table.startAvailabilityTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endAvailabilityTime => $composableBuilder(
      column: $table.endAvailabilityTime,
      builder: (column) => ColumnOrderings(column));
}

class $$TherapistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TherapistsTable> {
  $$TherapistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get clinicId =>
      $composableBuilder(column: $table.clinicId, builder: (column) => column);

  GeneratedColumn<bool> get approved =>
      $composableBuilder(column: $table.approved, builder: (column) => column);

  GeneratedColumn<String> get specialisation => $composableBuilder(
      column: $table.specialisation, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get offeredTherapiesJson => $composableBuilder(
      column: $table.offeredTherapiesJson, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get regulatoryBody => $composableBuilder(
      column: $table.regulatoryBody, builder: (column) => column);

  GeneratedColumn<String> get startAvailabilityTime => $composableBuilder(
      column: $table.startAvailabilityTime, builder: (column) => column);

  GeneratedColumn<String> get endAvailabilityTime => $composableBuilder(
      column: $table.endAvailabilityTime, builder: (column) => column);
}

class $$TherapistsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TherapistsTable,
    TherapistDbEntity,
    $$TherapistsTableFilterComposer,
    $$TherapistsTableOrderingComposer,
    $$TherapistsTableAnnotationComposer,
    $$TherapistsTableCreateCompanionBuilder,
    $$TherapistsTableUpdateCompanionBuilder,
    (
      TherapistDbEntity,
      BaseReferences<_$AppDatabase, $TherapistsTable, TherapistDbEntity>
    ),
    TherapistDbEntity,
    PrefetchHooks Function()> {
  $$TherapistsTableTableManager(_$AppDatabase db, $TherapistsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TherapistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TherapistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TherapistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String> clinicId = const Value.absent(),
            Value<bool> approved = const Value.absent(),
            Value<String> specialisation = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<String> offeredTherapiesJson = const Value.absent(),
            Value<int> age = const Value.absent(),
            Value<String> regulatoryBody = const Value.absent(),
            Value<String> startAvailabilityTime = const Value.absent(),
            Value<String> endAvailabilityTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TherapistsCompanion(
            id: id,
            createdAt: createdAt,
            name: name,
            email: email,
            phone: phone,
            clinicId: clinicId,
            approved: approved,
            specialisation: specialisation,
            gender: gender,
            offeredTherapiesJson: offeredTherapiesJson,
            age: age,
            regulatoryBody: regulatoryBody,
            startAvailabilityTime: startAvailabilityTime,
            endAvailabilityTime: endAvailabilityTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime createdAt,
            required String name,
            required String email,
            required String phone,
            required String clinicId,
            required bool approved,
            required String specialisation,
            required String gender,
            required String offeredTherapiesJson,
            required int age,
            required String regulatoryBody,
            required String startAvailabilityTime,
            required String endAvailabilityTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              TherapistsCompanion.insert(
            id: id,
            createdAt: createdAt,
            name: name,
            email: email,
            phone: phone,
            clinicId: clinicId,
            approved: approved,
            specialisation: specialisation,
            gender: gender,
            offeredTherapiesJson: offeredTherapiesJson,
            age: age,
            regulatoryBody: regulatoryBody,
            startAvailabilityTime: startAvailabilityTime,
            endAvailabilityTime: endAvailabilityTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TherapistsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TherapistsTable,
    TherapistDbEntity,
    $$TherapistsTableFilterComposer,
    $$TherapistsTableOrderingComposer,
    $$TherapistsTableAnnotationComposer,
    $$TherapistsTableCreateCompanionBuilder,
    $$TherapistsTableUpdateCompanionBuilder,
    (
      TherapistDbEntity,
      BaseReferences<_$AppDatabase, $TherapistsTable, TherapistDbEntity>
    ),
    TherapistDbEntity,
    PrefetchHooks Function()>;
typedef $$ConsultationRequestsTableCreateCompanionBuilder
    = ConsultationRequestsCompanion Function({
  required String id,
  required String patientId,
  required String therapistId,
  required String status,
  required DateTime requestedDttm,
  Value<String?> reason,
  Value<DateTime?> scheduledDttm,
  Value<int> rowid,
});
typedef $$ConsultationRequestsTableUpdateCompanionBuilder
    = ConsultationRequestsCompanion Function({
  Value<String> id,
  Value<String> patientId,
  Value<String> therapistId,
  Value<String> status,
  Value<DateTime> requestedDttm,
  Value<String?> reason,
  Value<DateTime?> scheduledDttm,
  Value<int> rowid,
});

class $$ConsultationRequestsTableFilterComposer
    extends Composer<_$AppDatabase, $ConsultationRequestsTable> {
  $$ConsultationRequestsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get therapistId => $composableBuilder(
      column: $table.therapistId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get requestedDttm => $composableBuilder(
      column: $table.requestedDttm, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get scheduledDttm => $composableBuilder(
      column: $table.scheduledDttm, builder: (column) => ColumnFilters(column));
}

class $$ConsultationRequestsTableOrderingComposer
    extends Composer<_$AppDatabase, $ConsultationRequestsTable> {
  $$ConsultationRequestsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get therapistId => $composableBuilder(
      column: $table.therapistId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get requestedDttm => $composableBuilder(
      column: $table.requestedDttm,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get scheduledDttm => $composableBuilder(
      column: $table.scheduledDttm,
      builder: (column) => ColumnOrderings(column));
}

class $$ConsultationRequestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConsultationRequestsTable> {
  $$ConsultationRequestsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get therapistId => $composableBuilder(
      column: $table.therapistId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get requestedDttm => $composableBuilder(
      column: $table.requestedDttm, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledDttm => $composableBuilder(
      column: $table.scheduledDttm, builder: (column) => column);
}

class $$ConsultationRequestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ConsultationRequestsTable,
    ConsultationRequestDbEntity,
    $$ConsultationRequestsTableFilterComposer,
    $$ConsultationRequestsTableOrderingComposer,
    $$ConsultationRequestsTableAnnotationComposer,
    $$ConsultationRequestsTableCreateCompanionBuilder,
    $$ConsultationRequestsTableUpdateCompanionBuilder,
    (
      ConsultationRequestDbEntity,
      BaseReferences<_$AppDatabase, $ConsultationRequestsTable,
          ConsultationRequestDbEntity>
    ),
    ConsultationRequestDbEntity,
    PrefetchHooks Function()> {
  $$ConsultationRequestsTableTableManager(
      _$AppDatabase db, $ConsultationRequestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConsultationRequestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConsultationRequestsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConsultationRequestsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<String> therapistId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> requestedDttm = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<DateTime?> scheduledDttm = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ConsultationRequestsCompanion(
            id: id,
            patientId: patientId,
            therapistId: therapistId,
            status: status,
            requestedDttm: requestedDttm,
            reason: reason,
            scheduledDttm: scheduledDttm,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            required String therapistId,
            required String status,
            required DateTime requestedDttm,
            Value<String?> reason = const Value.absent(),
            Value<DateTime?> scheduledDttm = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ConsultationRequestsCompanion.insert(
            id: id,
            patientId: patientId,
            therapistId: therapistId,
            status: status,
            requestedDttm: requestedDttm,
            reason: reason,
            scheduledDttm: scheduledDttm,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ConsultationRequestsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ConsultationRequestsTable,
        ConsultationRequestDbEntity,
        $$ConsultationRequestsTableFilterComposer,
        $$ConsultationRequestsTableOrderingComposer,
        $$ConsultationRequestsTableAnnotationComposer,
        $$ConsultationRequestsTableCreateCompanionBuilder,
        $$ConsultationRequestsTableUpdateCompanionBuilder,
        (
          ConsultationRequestDbEntity,
          BaseReferences<_$AppDatabase, $ConsultationRequestsTable,
              ConsultationRequestDbEntity>
        ),
        ConsultationRequestDbEntity,
        PrefetchHooks Function()>;
typedef $$DailyActivitiesTableCreateCompanionBuilder = DailyActivitiesCompanion
    Function({
  required String id,
  required String patientId,
  required String description,
  required bool isCompleted,
  required DateTime date,
  Value<int> rowid,
});
typedef $$DailyActivitiesTableUpdateCompanionBuilder = DailyActivitiesCompanion
    Function({
  Value<String> id,
  Value<String> patientId,
  Value<String> description,
  Value<bool> isCompleted,
  Value<DateTime> date,
  Value<int> rowid,
});

class $$DailyActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $DailyActivitiesTable> {
  $$DailyActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));
}

class $$DailyActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyActivitiesTable> {
  $$DailyActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get patientId => $composableBuilder(
      column: $table.patientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));
}

class $$DailyActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyActivitiesTable> {
  $$DailyActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get patientId =>
      $composableBuilder(column: $table.patientId, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);
}

class $$DailyActivitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyActivitiesTable,
    TherapyDailyActivityDbEntity,
    $$DailyActivitiesTableFilterComposer,
    $$DailyActivitiesTableOrderingComposer,
    $$DailyActivitiesTableAnnotationComposer,
    $$DailyActivitiesTableCreateCompanionBuilder,
    $$DailyActivitiesTableUpdateCompanionBuilder,
    (
      TherapyDailyActivityDbEntity,
      BaseReferences<_$AppDatabase, $DailyActivitiesTable,
          TherapyDailyActivityDbEntity>
    ),
    TherapyDailyActivityDbEntity,
    PrefetchHooks Function()> {
  $$DailyActivitiesTableTableManager(
      _$AppDatabase db, $DailyActivitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyActivitiesCompanion(
            id: id,
            patientId: patientId,
            description: description,
            isCompleted: isCompleted,
            date: date,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            required String description,
            required bool isCompleted,
            required DateTime date,
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyActivitiesCompanion.insert(
            id: id,
            patientId: patientId,
            description: description,
            isCompleted: isCompleted,
            date: date,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyActivitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyActivitiesTable,
    TherapyDailyActivityDbEntity,
    $$DailyActivitiesTableFilterComposer,
    $$DailyActivitiesTableOrderingComposer,
    $$DailyActivitiesTableAnnotationComposer,
    $$DailyActivitiesTableCreateCompanionBuilder,
    $$DailyActivitiesTableUpdateCompanionBuilder,
    (
      TherapyDailyActivityDbEntity,
      BaseReferences<_$AppDatabase, $DailyActivitiesTable,
          TherapyDailyActivityDbEntity>
    ),
    TherapyDailyActivityDbEntity,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$TherapistsTableTableManager get therapists =>
      $$TherapistsTableTableManager(_db, _db.therapists);
  $$ConsultationRequestsTableTableManager get consultationRequests =>
      $$ConsultationRequestsTableTableManager(_db, _db.consultationRequests);
  $$DailyActivitiesTableTableManager get dailyActivities =>
      $$DailyActivitiesTableTableManager(_db, _db.dailyActivities);
}
