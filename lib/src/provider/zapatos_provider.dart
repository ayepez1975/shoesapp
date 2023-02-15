import 'package:flutter/material.dart';

class ZapatoProvider with ChangeNotifier {
  String _assetImage = 'assets/images/azul.png';
  double _talla = 9.0;

  String get assetImage => _assetImage;
  set assetImage(String valor) {
    _assetImage = valor;
    notifyListeners();
  }

  double get talla => _talla;
  set talla(double valor) {
    _talla = valor;
    notifyListeners();
  }
}
