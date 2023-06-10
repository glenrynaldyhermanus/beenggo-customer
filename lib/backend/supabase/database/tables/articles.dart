import '../database.dart';

class ArticlesTable extends SupabaseTable<ArticlesRow> {
  @override
  String get tableName => 'articles';

  @override
  ArticlesRow createRow(Map<String, dynamic> data) => ArticlesRow(data);
}

class ArticlesRow extends SupabaseDataRow {
  ArticlesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ArticlesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);
}
