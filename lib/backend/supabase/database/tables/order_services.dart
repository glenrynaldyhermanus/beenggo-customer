import '../database.dart';

class OrderServicesTable extends SupabaseTable<OrderServicesRow> {
  @override
  String get tableName => 'order_services';

  @override
  OrderServicesRow createRow(Map<String, dynamic> data) =>
      OrderServicesRow(data);
}

class OrderServicesRow extends SupabaseDataRow {
  OrderServicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrderServicesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get orderId => getField<int>('order_id')!;
  set orderId(int value) => setField<int>('order_id', value);

  int get serviceId => getField<int>('service_id')!;
  set serviceId(int value) => setField<int>('service_id', value);
}
