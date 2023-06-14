// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerVehicleStruct extends BaseStruct {
  CustomerVehicleStruct({
    String? name,
    String? brand,
    String? year,
    String? color,
    String? type,
  })  : _name = name,
        _brand = brand,
        _year = year,
        _color = color,
        _type = type;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  set brand(String? val) => _brand = val;
  bool hasBrand() => _brand != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;
  bool hasYear() => _year != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static CustomerVehicleStruct fromMap(Map<String, dynamic> data) =>
      CustomerVehicleStruct(
        name: data['name'] as String?,
        brand: data['brand'] as String?,
        year: data['year'] as String?,
        color: data['color'] as String?,
        type: data['type'] as String?,
      );

  static CustomerVehicleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CustomerVehicleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'brand': _brand,
        'year': _year,
        'color': _color,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'brand': serializeParam(
          _brand,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerVehicleStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerVehicleStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        brand: deserializeParam(
          data['brand'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerVehicleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerVehicleStruct &&
        name == other.name &&
        brand == other.brand &&
        year == other.year &&
        color == other.color &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, brand, year, color, type]);
}

CustomerVehicleStruct createCustomerVehicleStruct({
  String? name,
  String? brand,
  String? year,
  String? color,
  String? type,
}) =>
    CustomerVehicleStruct(
      name: name,
      brand: brand,
      year: year,
      color: color,
      type: type,
    );
