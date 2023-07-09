
import 'package:firebase_auth/firebase_auth.dart';



//user info
User? getCurrentUser() {
  User? user =  FirebaseAuth.instance.currentUser;
  return user;
}



//user id
String? getCurrentUserId() {
  User? user = FirebaseAuth.instance.currentUser;
  String? userId = user?.uid;
  return userId;
}


//user email
String? getCurrentUserEmail() {
  User? user = FirebaseAuth.instance.currentUser;
  String? email = user?.email;
  return email;
}


//user name
String? getCurrentUserName()   {
  User? user = FirebaseAuth.instance.currentUser;
  String? displayName = user?.displayName;
  return displayName;
}
//photo url
String? getCurrentUserProfilePhoto() {
  User? user = FirebaseAuth.instance.currentUser;
  String? photoUrl = user?.photoURL;
  return photoUrl;
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


