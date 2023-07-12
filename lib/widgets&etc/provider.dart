import 'package:flutter/foundation.dart';

class CheckboxModel extends ChangeNotifier {
  bool isChecked = false;
  String _logMail = "";
  String _logPass="";
  String _ppLink="lib/images/add_icon.png";

  String get logPass=>_logPass;
  String get logMail => _logMail;
  String get ppLink => _ppLink;

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  //logpage email field provider
  void textMail(String value) {
    _logMail = value;
    notifyListeners();
      }

  void textPass(String value){
    _logPass=value;
    notifyListeners();

  }

  void avatarLink(String value){
    _ppLink=value;
    notifyListeners();
  }
}



