import '../database.dart';

class AdditionalFeesTable extends SupabaseTable<AdditionalFeesRow> {
  @override
  String get tableName => 'additional_fees';

  @override
  AdditionalFeesRow createRow(Map<String, dynamic> data) =>
      AdditionalFeesRow(data);
}

class AdditionalFeesRow extends SupabaseDataRow {
  AdditionalFeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdditionalFeesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get fee => getField<double>('fee')!;
  set fee(double value) => setField<double>('fee', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
