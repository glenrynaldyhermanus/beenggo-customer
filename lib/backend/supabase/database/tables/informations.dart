import '../database.dart';

class InformationsTable extends SupabaseTable<InformationsRow> {
  @override
  String get tableName => 'informations';

  @override
  InformationsRow createRow(Map<String, dynamic> data) => InformationsRow(data);
}

class InformationsRow extends SupabaseDataRow {
  InformationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InformationsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get infoCategory => getField<String>('info_category')!;
  set infoCategory(String value) => setField<String>('info_category', value);

  String get info => getField<String>('info')!;
  set info(String value) => setField<String>('info', value);

  int get sequence => getField<int>('sequence')!;
  set sequence(int value) => setField<int>('sequence', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
