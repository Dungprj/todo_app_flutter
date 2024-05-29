import 'package:flutter/material.dart';

class PMysettings extends ChangeNotifier {
  bool _isDark = false;

  get isDark => _isDark;

  void SetBrightness(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
