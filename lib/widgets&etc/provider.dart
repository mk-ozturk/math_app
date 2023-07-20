import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:math_app/widgets&etc/FirebaseFuncs.dart';

class LogPageProvider extends ChangeNotifier {
  bool isChecked = false;
  String _logMail = "";
  String _logPass="";


  String get logPass=>_logPass;
  String get logMail => _logMail;




  //logpage email field provider
  void textMail(String value) {
    _logMail = value;
    notifyListeners();
      }

  void textPass(String value){
    _logPass=value;
    notifyListeners();

  }


}

class SignPageModel extends ChangeNotifier {
  String _ppLink="lib/images/add_icon.png";
  String _eMail="";
  String _password=" ";
  String _name=" ";
  String _surname=" ";

  String get ppLink => _ppLink;
  String get eMail => _eMail;
  String get password => _password;
  String get name => _name;
  String get surname => _surname;

  void avatarLink(String value){
    _ppLink=value;
    notifyListeners();
  }

  void emailText (String value){
    _eMail=value;
    notifyListeners();
  }

  void passwordText (String value){
    _password=value;
    notifyListeners();
  }

  void nameText (String value){
    _name=value;
    notifyListeners();
  }

  void surnameText (String value){
    _surname=value;
    notifyListeners();
  }
}




class FirebaseModel extends ChangeNotifier {
  String _ppUrl = getCurrentUserProfilePhoto().toString();

  String get ppUrl => _ppUrl;

  void firebasePP(String avatarUrl) {
    _ppUrl = avatarUrl;
    notifyListeners();
  }
}