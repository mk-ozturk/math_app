import 'package:flutter/foundation.dart';

class CheckboxModel extends ChangeNotifier {
  bool isChecked = false;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
