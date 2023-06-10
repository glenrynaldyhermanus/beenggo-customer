// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerStruct extends BaseStruct {
  CustomerStruct({
    String? fullName,
    DateTime? birthdate,
    String? gender,
    String? phone,
    String? pictureUrl,
  })  : _fullName = fullName,
        _birthdate = birthdate,
        _gender = gender,
        _phone = phone,
        _pictureUrl = pictureUrl;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;
  bool hasFullName() => _fullName != null;

  // "birthdate" field.
  DateTime? _birthdate;
  DateTime? get birthdate => _birthdate;
  set birthdate(DateTime? val) => _birthdate = val;
  bool hasBirthdate() => _birthdate != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;
  bool hasPhone() => _phone != null;

  // "picture_url" field.
  String? _pictureUrl;
  String get pictureUrl => _pictureUrl ?? '';
  set pictureUrl(String? val) => _pictureUrl = val;
  bool hasPictureUrl() => _pictureUrl != null;

  static CustomerStruct fromMap(Map<String, dynamic> data) => CustomerStruct(
        fullName: data['fullName'] as String?,
        birthdate: data['birthdate'] as DateTime?,
        gender: data['gender'] as String?,
        phone: data['phone'] as String?,
        pictureUrl: data['picture_url'] as String?,
      );

  static CustomerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CustomerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'fullName': _fullName,
        'birthdate': _birthdate,
        'gender': _gender,
        'phone': _phone,
        'picture_url': _pictureUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'birthdate': serializeParam(
          _birthdate,
          ParamType.DateTime,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'picture_url': serializeParam(
          _pictureUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerStruct(
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        birthdate: deserializeParam(
          data['birthdate'],
          ParamType.DateTime,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        pictureUrl: deserializeParam(
          data['picture_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerStruct &&
        fullName == other.fullName &&
        birthdate == other.birthdate &&
        gender == other.gender &&
        phone == other.phone &&
        pictureUrl == other.pictureUrl;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([fullName, birthdate, gender, phone, pictureUrl]);
}

CustomerStruct createCustomerStruct({
  String? fullName,
  DateTime? birthdate,
  String? gender,
  String? phone,
  String? pictureUrl,
}) =>
    CustomerStruct(
      fullName: fullName,
      birthdate: birthdate,
      gender: gender,
      phone: phone,
      pictureUrl: pictureUrl,
    );
