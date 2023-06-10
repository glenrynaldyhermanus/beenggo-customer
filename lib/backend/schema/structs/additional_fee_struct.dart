// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdditionalFeeStruct extends BaseStruct {
  AdditionalFeeStruct({
    String? name,
    double? fee,
  })  : _name = name,
        _fee = fee;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "fee" field.
  double? _fee;
  double get fee => _fee ?? 0.0;
  set fee(double? val) => _fee = val;
  void incrementFee(double amount) => _fee = fee + amount;
  bool hasFee() => _fee != null;

  static AdditionalFeeStruct fromMap(Map<String, dynamic> data) =>
      AdditionalFeeStruct(
        name: data['name'] as String?,
        fee: castToType<double>(data['fee']),
      );

  static AdditionalFeeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AdditionalFeeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'fee': _fee,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'fee': serializeParam(
          _fee,
          ParamType.double,
        ),
      }.withoutNulls;

  static AdditionalFeeStruct fromSerializableMap(Map<String, dynamic> data) =>
      AdditionalFeeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        fee: deserializeParam(
          data['fee'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'AdditionalFeeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AdditionalFeeStruct &&
        name == other.name &&
        fee == other.fee;
  }

  @override
  int get hashCode => const ListEquality().hash([name, fee]);
}

AdditionalFeeStruct createAdditionalFeeStruct({
  String? name,
  double? fee,
}) =>
    AdditionalFeeStruct(
      name: name,
      fee: fee,
    );
