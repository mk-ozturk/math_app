
import 'package:firebase_auth/firebase_auth.dart';




// user register










//User sign out
void signOutUser() async {
  try {
    await FirebaseAuth.instance.signOut();
    print('Kullanıcı çıkış yaptı');
  } catch (e) {
    print('Hata: $e');
  }
}





//User status
void checkUserLoggedIn() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('Kullanıcı oturumu kapattı');

    } else {
      print('Kullanıcı oturumu açtı: ${user.uid}');
    }
  });
}