// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderStruct extends BaseStruct {
  OrderStruct({
    String? orderNo,
    DateTime? scheduledAt,
    List<ServiceStruct>? orderServices,
    String? status,
    bool? isPaid,
    double? total,
    int? customerId,
    int? mechanicId,
  })  : _orderNo = orderNo,
        _scheduledAt = scheduledAt,
        _orderServices = orderServices,
        _status = status,
        _isPaid = isPaid,
        _total = total,
        _customerId = customerId,
        _mechanicId = mechanicId;

  // "orderNo" field.
  String? _orderNo;
  String get orderNo => _orderNo ?? '';
  set orderNo(String? val) => _orderNo = val;
  bool hasOrderNo() => _orderNo != null;

  // "scheduledAt" field.
  DateTime? _scheduledAt;
  DateTime? get scheduledAt => _scheduledAt;
  set scheduledAt(DateTime? val) => _scheduledAt = val;
  bool hasScheduledAt() => _scheduledAt != null;

  // "orderServices" field.
  List<ServiceStruct>? _orderServices;
  List<ServiceStruct> get orderServices => _orderServices ?? const [];
  set orderServices(List<ServiceStruct>? val) => _orderServices = val;
  void updateOrderServices(Function(List<ServiceStruct>) updateFn) =>
      updateFn(_orderServices ??= []);
  bool hasOrderServices() => _orderServices != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "isPaid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  set isPaid(bool? val) => _isPaid = val;
  bool hasIsPaid() => _isPaid != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "customerId" field.
  int? _customerId;
  int get customerId => _customerId ?? 0;
  set customerId(int? val) => _customerId = val;
  void incrementCustomerId(int amount) => _customerId = customerId + amount;
  bool hasCustomerId() => _customerId != null;

  // "mechanicId" field.
  int? _mechanicId;
  int get mechanicId => _mechanicId ?? 0;
  set mechanicId(int? val) => _mechanicId = val;
  void incrementMechanicId(int amount) => _mechanicId = mechanicId + amount;
  bool hasMechanicId() => _mechanicId != null;

  static OrderStruct fromMap(Map<String, dynamic> data) => OrderStruct(
        orderNo: data['orderNo'] as String?,
        scheduledAt: data['scheduledAt'] as DateTime?,
        orderServices: getStructList(
          data['orderServices'],
          ServiceStruct.fromMap,
        ),
        status: data['status'] as String?,
        isPaid: data['isPaid'] as bool?,
        total: castToType<double>(data['total']),
        customerId: data['customerId'] as int?,
        mechanicId: data['mechanicId'] as int?,
      );

  static OrderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'orderNo': _orderNo,
        'scheduledAt': _scheduledAt,
        'orderServices': _orderServices?.map((e) => e.toMap()).toList(),
        'status': _status,
        'isPaid': _isPaid,
        'total': _total,
        'customerId': _customerId,
        'mechanicId': _mechanicId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderNo': serializeParam(
          _orderNo,
          ParamType.String,
        ),
        'scheduledAt': serializeParam(
          _scheduledAt,
          ParamType.DateTime,
        ),
        'orderServices': serializeParam(
          _orderServices,
          ParamType.DataStruct,
          true,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'isPaid': serializeParam(
          _isPaid,
          ParamType.bool,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'customerId': serializeParam(
          _customerId,
          ParamType.int,
        ),
        'mechanicId': serializeParam(
          _mechanicId,
          ParamType.int,
        ),
      }.withoutNulls;

  static OrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderStruct(
        orderNo: deserializeParam(
          data['orderNo'],
          ParamType.String,
          false,
        ),
        scheduledAt: deserializeParam(
          data['scheduledAt'],
          ParamType.DateTime,
          false,
        ),
        orderServices: deserializeParam<ServiceStruct>(
          data['orderServices'],
          ParamType.DataStruct,
          true,
          structBuilder: ServiceStruct.fromSerializableMap,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        isPaid: deserializeParam(
          data['isPaid'],
          ParamType.bool,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        customerId: deserializeParam(
          data['customerId'],
          ParamType.int,
          false,
        ),
        mechanicId: deserializeParam(
          data['mechanicId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrderStruct &&
        orderNo == other.orderNo &&
        scheduledAt == other.scheduledAt &&
        listEquality.equals(orderServices, other.orderServices) &&
        status == other.status &&
        isPaid == other.isPaid &&
        total == other.total &&
        customerId == other.customerId &&
        mechanicId == other.mechanicId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        orderNo,
        scheduledAt,
        orderServices,
        status,
        isPaid,
        total,
        customerId,
        mechanicId
      ]);
}

OrderStruct createOrderStruct({
  String? orderNo,
  DateTime? scheduledAt,
  String? status,
  bool? isPaid,
  double? total,
  int? customerId,
  int? mechanicId,
}) =>
    OrderStruct(
      orderNo: orderNo,
      scheduledAt: scheduledAt,
      status: status,
      isPaid: isPaid,
      total: total,
      customerId: customerId,
      mechanicId: mechanicId,
    );
