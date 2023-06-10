import '../database.dart';

class DiscountsTable extends SupabaseTable<DiscountsRow> {
  @override
  String get tableName => 'discounts';

  @override
  DiscountsRow createRow(Map<String, dynamic> data) => DiscountsRow(data);
}

class DiscountsRow extends SupabaseDataRow {
  DiscountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiscountsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get discount => getField<double>('discount')!;
  set discount(double value) => setField<double>('discount', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
