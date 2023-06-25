import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../widgets&etc/colors.dart';

class SignPage extends StatefulWidget {


  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  TextEditingController _id=TextEditingController();
  TextEditingController _surname=TextEditingController();
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    String errorMessage = 'qS';


    void registerUser(String email, String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        print('Kullanıcı kaydedildi: ${user!.uid}');
      } catch (e) {
        if (e is FirebaseAuthException) {


          switch (e.code) {
            case 'email-already-in-use':
              errorMessage = 'Bu e-posta adresi zaten kullanılıyor.';

              break;
            case 'invalid-email':
              errorMessage = 'Geçersiz e-posta adresi formatı.';

              break;
            case 'weak-password':
              errorMessage = 'Zayıf bir şifre kullanıldı.';
              break;
          // Diğer hata durumları için gerekli kodları buraya ekleyebilirsiniz
            default:
              errorMessage = 'Bir hata oluştu. Lütfen tekrar deneyin.';

              break;
          }

          print('Hata: $errorMessage');

          // Hata mesajını kullanıcıya gösterebilirsiniz
        } else {
          print('Bir hata oluştu: $e');
          // Genel bir hata mesajı gösterebilirsiniz
        }
      }
    }














    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme().themColors[4],
          title: Text("Demo Page"),
        ),
        body: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(width: (scrWidth-35)/2,
                    child: TextField(
                      controller: _name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Ad"
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: (scrWidth-35)/2,
                    child: TextField(
                      controller: _surname,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Soyad"
                      ),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-Posta"
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _id,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Kullanıcı Adı"
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Şifre"
                ),),
            ),
              Text(errorMessage),
            Spacer(),
            SizedBox(width:scrWidth,height: 75
                ,
                child: ElevatedButton(onPressed: (){

                  setState(() {
                    registerUser(_email.text, _password.text);
                  });
                },child: Text("Kayıt Ol"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme().themColors[0],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      )
                  ),))
          ],

        ));
  }
}

