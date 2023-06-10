// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedServiceStruct extends BaseStruct {
  SelectedServiceStruct({
    int? id,
    String? name,
    double? fee,
  })  : _id = id,
        _name = name,
        _fee = fee;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

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

  static SelectedServiceStruct fromMap(Map<String, dynamic> data) =>
      SelectedServiceStruct(
        id: data['id'] as int?,
        name: data['name'] as String?,
        fee: castToType<double>(data['fee']),
      );

  static SelectedServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SelectedServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'fee': _fee,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'fee': serializeParam(
          _fee,
          ParamType.double,
        ),
      }.withoutNulls;

  static SelectedServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedServiceStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
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
  String toString() => 'SelectedServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedServiceStruct &&
        id == other.id &&
        name == other.name &&
        fee == other.fee;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, fee]);
}

SelectedServiceStruct createSelectedServiceStruct({
  int? id,
  String? name,
  double? fee,
}) =>
    SelectedServiceStruct(
      id: id,
      name: name,
      fee: fee,
    );
