import 'package:flutter/foundation.dart';

class CheckboxModel extends ChangeNotifier {
  bool isChecked = false;
  String _logMail = '';

  String get text => _logMail;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  //logpage email field provider
  set text(String value) {
    _logMail = value;
    notifyListeners();
  }
}



