import '../database.dart';

class VehicleCategoriesTable extends SupabaseTable<VehicleCategoriesRow> {
  @override
  String get tableName => 'vehicle_categories';

  @override
  VehicleCategoriesRow createRow(Map<String, dynamic> data) =>
      VehicleCategoriesRow(data);
}

class VehicleCategoriesRow extends SupabaseDataRow {
  VehicleCategoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VehicleCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
