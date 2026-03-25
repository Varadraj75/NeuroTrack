// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'therapist_patient_details_entity.dart';

class TherapistPatientDetailsEntityMapper
    extends ClassMapperBase<TherapistPatientDetailsEntity> {
  TherapistPatientDetailsEntityMapper._();

  static TherapistPatientDetailsEntityMapper? _instance;
  static TherapistPatientDetailsEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(
        _instance = TherapistPatientDetailsEntityMapper._(),
      );
    }
    return _instance!;
  }

  @override
  final String id = 'TherapistPatientDetailsEntity';

  static String _$patientId(TherapistPatientDetailsEntity v) => v.patientId;
  static const Field<TherapistPatientDetailsEntity, String> _f$patientId =
      Field('patientId', _$patientId, key: r'id');
  static String _$patientName(TherapistPatientDetailsEntity v) => v.patientName;
  static const Field<TherapistPatientDetailsEntity, String> _f$patientName =
      Field('patientName', _$patientName, key: r'name');
  static String _$email(TherapistPatientDetailsEntity v) => v.email;
  static const Field<TherapistPatientDetailsEntity, String> _f$email = Field(
    'email',
    _$email,
  );
  static String _$phoneNo(TherapistPatientDetailsEntity v) => v.phoneNo;
  static const Field<TherapistPatientDetailsEntity, String> _f$phoneNo = Field(
    'phoneNo',
    _$phoneNo,
    key: r'phone',
  );
  static bool _$isAdult(TherapistPatientDetailsEntity v) => v.isAdult;
  static const Field<TherapistPatientDetailsEntity, bool> _f$isAdult = Field(
    'isAdult',
    _$isAdult,
    key: r'is_adult',
  );
  static int? _$age(TherapistPatientDetailsEntity v) => v.age;
  static const Field<TherapistPatientDetailsEntity, int> _f$age = Field(
    'age',
    _$age,
    opt: true,
  );
  static String? _$guardianName(TherapistPatientDetailsEntity v) =>
      v.guardianName;
  static const Field<TherapistPatientDetailsEntity, String> _f$guardianName =
      Field('guardianName', _$guardianName, key: r'guardian_name', opt: true);
  static String? _$guardianRelation(TherapistPatientDetailsEntity v) =>
      v.guardianRelation;
  static const Field<TherapistPatientDetailsEntity, String>
  _f$guardianRelation = Field(
    'guardianRelation',
    _$guardianRelation,
    key: r'guardian_relation',
    opt: true,
  );
  static int? _$autismLevel(TherapistPatientDetailsEntity v) => v.autismLevel;
  static const Field<TherapistPatientDetailsEntity, int> _f$autismLevel = Field(
    'autismLevel',
    _$autismLevel,
    key: r'autism_level',
    opt: true,
  );
  static DateTime? _$onboardedOn(TherapistPatientDetailsEntity v) =>
      v.onboardedOn;
  static const Field<TherapistPatientDetailsEntity, DateTime> _f$onboardedOn =
      Field('onboardedOn', _$onboardedOn, key: r'onboarded_on', opt: true);
  static String? _$therapistId(TherapistPatientDetailsEntity v) =>
      v.therapistId;
  static const Field<TherapistPatientDetailsEntity, String> _f$therapistId =
      Field('therapistId', _$therapistId, key: r'therapist_id', opt: true);
  static String? _$gender(TherapistPatientDetailsEntity v) => v.gender;
  static const Field<TherapistPatientDetailsEntity, String> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
  );
  static String? _$country(TherapistPatientDetailsEntity v) => v.country;
  static const Field<TherapistPatientDetailsEntity, String> _f$country = Field(
    'country',
    _$country,
    opt: true,
  );

  @override
  final MappableFields<TherapistPatientDetailsEntity> fields = const {
    #patientId: _f$patientId,
    #patientName: _f$patientName,
    #email: _f$email,
    #phoneNo: _f$phoneNo,
    #isAdult: _f$isAdult,
    #age: _f$age,
    #guardianName: _f$guardianName,
    #guardianRelation: _f$guardianRelation,
    #autismLevel: _f$autismLevel,
    #onboardedOn: _f$onboardedOn,
    #therapistId: _f$therapistId,
    #gender: _f$gender,
    #country: _f$country,
  };

  static TherapistPatientDetailsEntity _instantiate(DecodingData data) {
    return TherapistPatientDetailsEntity(
      patientId: data.dec(_f$patientId),
      patientName: data.dec(_f$patientName),
      email: data.dec(_f$email),
      phoneNo: data.dec(_f$phoneNo),
      isAdult: data.dec(_f$isAdult),
      age: data.dec(_f$age),
      guardianName: data.dec(_f$guardianName),
      guardianRelation: data.dec(_f$guardianRelation),
      autismLevel: data.dec(_f$autismLevel),
      onboardedOn: data.dec(_f$onboardedOn),
      therapistId: data.dec(_f$therapistId),
      gender: data.dec(_f$gender),
      country: data.dec(_f$country),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TherapistPatientDetailsEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TherapistPatientDetailsEntity>(map);
  }

  static TherapistPatientDetailsEntity fromJson(String json) {
    return ensureInitialized().decodeJson<TherapistPatientDetailsEntity>(json);
  }
}

mixin TherapistPatientDetailsEntityMappable {
  String toJson() {
    return TherapistPatientDetailsEntityMapper.ensureInitialized()
        .encodeJson<TherapistPatientDetailsEntity>(
          this as TherapistPatientDetailsEntity,
        );
  }

  Map<String, dynamic> toMap() {
    return TherapistPatientDetailsEntityMapper.ensureInitialized()
        .encodeMap<TherapistPatientDetailsEntity>(
          this as TherapistPatientDetailsEntity,
        );
  }

  TherapistPatientDetailsEntityCopyWith<
    TherapistPatientDetailsEntity,
    TherapistPatientDetailsEntity,
    TherapistPatientDetailsEntity
  >
  get copyWith =>
      _TherapistPatientDetailsEntityCopyWithImpl<
        TherapistPatientDetailsEntity,
        TherapistPatientDetailsEntity
      >(this as TherapistPatientDetailsEntity, $identity, $identity);
  @override
  String toString() {
    return TherapistPatientDetailsEntityMapper.ensureInitialized()
        .stringifyValue(this as TherapistPatientDetailsEntity);
  }

  @override
  bool operator ==(Object other) {
    return TherapistPatientDetailsEntityMapper.ensureInitialized().equalsValue(
      this as TherapistPatientDetailsEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return TherapistPatientDetailsEntityMapper.ensureInitialized().hashValue(
      this as TherapistPatientDetailsEntity,
    );
  }
}

extension TherapistPatientDetailsEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TherapistPatientDetailsEntity, $Out> {
  TherapistPatientDetailsEntityCopyWith<$R, TherapistPatientDetailsEntity, $Out>
  get $asTherapistPatientDetailsEntity => $base.as(
    (v, t, t2) =>
        _TherapistPatientDetailsEntityCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TherapistPatientDetailsEntityCopyWith<
  $R,
  $In extends TherapistPatientDetailsEntity,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? patientId,
    String? patientName,
    String? email,
    String? phoneNo,
    bool? isAdult,
    int? age,
    String? guardianName,
    String? guardianRelation,
    int? autismLevel,
    DateTime? onboardedOn,
    String? therapistId,
    String? gender,
    String? country,
  });
  TherapistPatientDetailsEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TherapistPatientDetailsEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TherapistPatientDetailsEntity, $Out>
    implements
        TherapistPatientDetailsEntityCopyWith<
          $R,
          TherapistPatientDetailsEntity,
          $Out
        > {
  _TherapistPatientDetailsEntityCopyWithImpl(
    super.value,
    super.then,
    super.then2,
  );

  @override
  late final ClassMapperBase<TherapistPatientDetailsEntity> $mapper =
      TherapistPatientDetailsEntityMapper.ensureInitialized();
  @override
  $R call({
    String? patientId,
    String? patientName,
    String? email,
    String? phoneNo,
    bool? isAdult,
    Object? age = $none,
    Object? guardianName = $none,
    Object? guardianRelation = $none,
    Object? autismLevel = $none,
    Object? onboardedOn = $none,
    Object? therapistId = $none,
    Object? gender = $none,
    Object? country = $none,
  }) => $apply(
    FieldCopyWithData({
      if (patientId != null) #patientId: patientId,
      if (patientName != null) #patientName: patientName,
      if (email != null) #email: email,
      if (phoneNo != null) #phoneNo: phoneNo,
      if (isAdult != null) #isAdult: isAdult,
      if (age != $none) #age: age,
      if (guardianName != $none) #guardianName: guardianName,
      if (guardianRelation != $none) #guardianRelation: guardianRelation,
      if (autismLevel != $none) #autismLevel: autismLevel,
      if (onboardedOn != $none) #onboardedOn: onboardedOn,
      if (therapistId != $none) #therapistId: therapistId,
      if (gender != $none) #gender: gender,
      if (country != $none) #country: country,
    }),
  );
  @override
  TherapistPatientDetailsEntity $make(CopyWithData data) =>
      TherapistPatientDetailsEntity(
        patientId: data.get(#patientId, or: $value.patientId),
        patientName: data.get(#patientName, or: $value.patientName),
        email: data.get(#email, or: $value.email),
        phoneNo: data.get(#phoneNo, or: $value.phoneNo),
        isAdult: data.get(#isAdult, or: $value.isAdult),
        age: data.get(#age, or: $value.age),
        guardianName: data.get(#guardianName, or: $value.guardianName),
        guardianRelation: data.get(
          #guardianRelation,
          or: $value.guardianRelation,
        ),
        autismLevel: data.get(#autismLevel, or: $value.autismLevel),
        onboardedOn: data.get(#onboardedOn, or: $value.onboardedOn),
        therapistId: data.get(#therapistId, or: $value.therapistId),
        gender: data.get(#gender, or: $value.gender),
        country: data.get(#country, or: $value.country),
      );

  @override
  TherapistPatientDetailsEntityCopyWith<
    $R2,
    TherapistPatientDetailsEntity,
    $Out2
  >
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TherapistPatientDetailsEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

