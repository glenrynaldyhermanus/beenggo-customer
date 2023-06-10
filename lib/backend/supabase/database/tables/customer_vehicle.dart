import '../database.dart';

class CustomerVehicleTable extends SupabaseTable<CustomerVehicleRow> {
  @override
  String get tableName => 'customer_vehicle';

  @override
  CustomerVehicleRow createRow(Map<String, dynamic> data) =>
      CustomerVehicleRow(data);
}

class CustomerVehicleRow extends SupabaseDataRow {
  CustomerVehicleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CustomerVehicleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get customerId => getField<int>('customer_id')!;
  set customerId(int value) => setField<int>('customer_id', value);

  String get brand => getField<String>('brand')!;
  set brand(String value) => setField<String>('brand', value);

  String get year => getField<String>('year')!;
  set year(String value) => setField<String>('year', value);

  String get color => getField<String>('color')!;
  set color(String value) => setField<String>('color', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
