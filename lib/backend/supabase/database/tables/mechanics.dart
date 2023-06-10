import '../database.dart';

class MechanicsTable extends SupabaseTable<MechanicsRow> {
  @override
  String get tableName => 'mechanics';

  @override
  MechanicsRow createRow(Map<String, dynamic> data) => MechanicsRow(data);
}

class MechanicsRow extends SupabaseDataRow {
  MechanicsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MechanicsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userUuid => getField<String>('user_uuid')!;
  set userUuid(String value) => setField<String>('user_uuid', value);

  String get fullName => getField<String>('full_name')!;
  set fullName(String value) => setField<String>('full_name', value);

  DateTime? get birthdate => getField<DateTime>('birthdate');
  set birthdate(DateTime? value) => setField<DateTime>('birthdate', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
