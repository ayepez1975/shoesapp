import 'package:flutter/cupertino.dart';

class ConnectivyInternet with ChangeNotifier {
  bool _isDeviceConnected = false;
  bool _isAlerSet = false;

  bool get isDeviceConnected => _isDeviceConnected;
  set isDeviceConnected(bool value) {
    _isDeviceConnected = value;
    notifyListeners();
  }

  bool get isAlertSet => _isAlerSet;
  set isAlertSet(bool value) {
    _isAlerSet = value;
    notifyListeners();
  }
}
