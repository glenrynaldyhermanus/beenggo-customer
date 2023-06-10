// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiscountStruct extends BaseStruct {
  DiscountStruct({
    String? name,
    double? discount,
  })  : _name = name,
        _discount = discount;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;
  void incrementDiscount(double amount) => _discount = discount + amount;
  bool hasDiscount() => _discount != null;

  static DiscountStruct fromMap(Map<String, dynamic> data) => DiscountStruct(
        name: data['name'] as String?,
        discount: castToType<double>(data['discount']),
      );

  static DiscountStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? DiscountStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'discount': _discount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'discount': serializeParam(
          _discount,
          ParamType.double,
        ),
      }.withoutNulls;

  static DiscountStruct fromSerializableMap(Map<String, dynamic> data) =>
      DiscountStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        discount: deserializeParam(
          data['discount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DiscountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DiscountStruct &&
        name == other.name &&
        discount == other.discount;
  }

  @override
  int get hashCode => const ListEquality().hash([name, discount]);
}

DiscountStruct createDiscountStruct({
  String? name,
  double? discount,
}) =>
    DiscountStruct(
      name: name,
      discount: discount,
    );
