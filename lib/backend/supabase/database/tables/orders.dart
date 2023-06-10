import '../database.dart';

class OrdersTable extends SupabaseTable<OrdersRow> {
  @override
  String get tableName => 'orders';

  @override
  OrdersRow createRow(Map<String, dynamic> data) => OrdersRow(data);
}

class OrdersRow extends SupabaseDataRow {
  OrdersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrdersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get orderNo => getField<String>('order_no')!;
  set orderNo(String value) => setField<String>('order_no', value);

  DateTime get shceduledAt => getField<DateTime>('shceduled_at')!;
  set shceduledAt(DateTime value) => setField<DateTime>('shceduled_at', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  bool get isPaid => getField<bool>('is_paid')!;
  set isPaid(bool value) => setField<bool>('is_paid', value);

  double get total => getField<double>('total')!;
  set total(double value) => setField<double>('total', value);

  int get mechanicId => getField<int>('mechanic_id')!;
  set mechanicId(int value) => setField<int>('mechanic_id', value);

  int get customerId => getField<int>('customer_id')!;
  set customerId(int value) => setField<int>('customer_id', value);
}
