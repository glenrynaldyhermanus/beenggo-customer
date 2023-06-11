import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _customerAddress = await secureStorage.getString('ff_customerAddress') ??
          _customerAddress;
    });
    await _safeInitAsync(() async {
      _customerLatLng = _latLngFromString(
              await secureStorage.getString('ff_customerLatLng')) ??
          _customerLatLng;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_customerVehicle') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_customerVehicle') ?? '{}';
          _customerVehicle = CustomerVehicleStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_profile') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_profile') ?? '{}';
          _profile =
              CustomerStruct.fromSerializableMap(jsonDecode(serializedData));
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

  late FlutterSecureStorage secureStorage;

  String _customerAddress = '';
  String get customerAddress => _customerAddress;
  set customerAddress(String _value) {
    _customerAddress = _value;
    secureStorage.setString('ff_customerAddress', _value);
  }

  void deleteCustomerAddress() {
    secureStorage.delete(key: 'ff_customerAddress');
  }

  LatLng? _customerLatLng = LatLng(-6.2087634, 106.845599);
  LatLng? get customerLatLng => _customerLatLng;
  set customerLatLng(LatLng? _value) {
    _customerLatLng = _value;
    _value != null
        ? secureStorage.setString('ff_customerLatLng', _value.serialize())
        : secureStorage.remove('ff_customerLatLng');
  }

  void deleteCustomerLatLng() {
    secureStorage.delete(key: 'ff_customerLatLng');
  }

  CustomerVehicleStruct _customerVehicle = CustomerVehicleStruct();
  CustomerVehicleStruct get customerVehicle => _customerVehicle;
  set customerVehicle(CustomerVehicleStruct _value) {
    _customerVehicle = _value;
    secureStorage.setString('ff_customerVehicle', _value.serialize());
  }

  void deleteCustomerVehicle() {
    secureStorage.delete(key: 'ff_customerVehicle');
  }

  void updateCustomerVehicleStruct(Function(CustomerVehicleStruct) updateFn) {
    updateFn(_customerVehicle);
    secureStorage.setString('ff_customerVehicle', _customerVehicle.serialize());
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

  CustomerStruct _profile = CustomerStruct();
  CustomerStruct get profile => _profile;
  set profile(CustomerStruct _value) {
    _profile = _value;
    secureStorage.setString('ff_profile', _value.serialize());
  }

  void deleteProfile() {
    secureStorage.delete(key: 'ff_profile');
  }

  void updateProfileStruct(Function(CustomerStruct) updateFn) {
    updateFn(_profile);
    secureStorage.setString('ff_profile', _profile.serialize());
  }

  bool _isLoginSkippable = true;
  bool get isLoginSkippable => _isLoginSkippable;
  set isLoginSkippable(bool _value) {
    _isLoginSkippable = _value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
