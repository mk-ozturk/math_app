
import 'package:firebase_auth/firebase_auth.dart';



// user register



// User sign in
void signInUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    print('Kullanıcı girişi yapıldı: ${user!.uid}');
  } catch (e) {
    print('Hata: $e');
  }
}






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