import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _customerAddress =
          prefs.getString('ff_customerAddress') ?? _customerAddress;
    });
    _safeInit(() {
      _customerLatLng =
          _latLngFromString(prefs.getString('ff_customerLatLng')) ??
              _customerLatLng;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_customerVehicle')) {
        try {
          final serializedData = prefs.getString('ff_customerVehicle') ?? '{}';
          _customerVehicle = CustomerVehicleStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _customerAddress = '';
  String get customerAddress => _customerAddress;
  set customerAddress(String _value) {
    _customerAddress = _value;
    prefs.setString('ff_customerAddress', _value);
  }

  LatLng? _customerLatLng = LatLng(-6.2087634, 106.845599);
  LatLng? get customerLatLng => _customerLatLng;
  set customerLatLng(LatLng? _value) {
    _customerLatLng = _value;
    _value != null
        ? prefs.setString('ff_customerLatLng', _value.serialize())
        : prefs.remove('ff_customerLatLng');
  }

  CustomerVehicleStruct _customerVehicle = CustomerVehicleStruct();
  CustomerVehicleStruct get customerVehicle => _customerVehicle;
  set customerVehicle(CustomerVehicleStruct _value) {
    _customerVehicle = _value;
    prefs.setString('ff_customerVehicle', _value.serialize());
  }

  void updateCustomerVehicleStruct(Function(CustomerVehicleStruct) updateFn) {
    updateFn(_customerVehicle);
    prefs.setString('ff_customerVehicle', _customerVehicle.serialize());
  }

  List<SelectedServiceStruct> _selectedServices = [];
  List<SelectedServiceStruct> get selectedServices => _selectedServices;
  set selectedServices(List<SelectedServiceStruct> _value) {
    _selectedServices = _value;
  }

  void addToSelectedServices(SelectedServiceStruct _value) {
    _selectedServices.add(_value);
  }

  void removeFromSelectedServices(SelectedServiceStruct _value) {
    _selectedServices.remove(_value);
  }

  void removeAtIndexFromSelectedServices(int _index) {
    _selectedServices.removeAt(_index);
  }

  void updateSelectedServicesAtIndex(
    int _index,
    SelectedServiceStruct Function(SelectedServiceStruct) updateFn,
  ) {
    _selectedServices[_index] = updateFn(_selectedServices[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
