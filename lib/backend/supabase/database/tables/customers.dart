import '../database.dart';

class CustomersTable extends SupabaseTable<CustomersRow> {
  @override
  String get tableName => 'customers';

  @override
  CustomersRow createRow(Map<String, dynamic> data) => CustomersRow(data);
}

class CustomersRow extends SupabaseDataRow {
  CustomersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CustomersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  DateTime? get birthdate => getField<DateTime>('birthdate');
  set birthdate(DateTime? value) => setField<DateTime>('birthdate', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);

  String get phone => getField<String>('phone')!;
  set phone(String value) => setField<String>('phone', value);

  String get userRef => getField<String>('user_ref')!;
  set userRef(String value) => setField<String>('user_ref', value);
}
