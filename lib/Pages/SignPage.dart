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






    Future<dynamic> registerUser(String email, String password) async {
      try {
        // Firebase'e yeni bir kullanıcı kaydetme işlemi
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Kullanıcı başarıyla kaydedildi
      } catch (e) {
        if (e is FirebaseAuthException) {
          String errorMessage = e.message!;
          String errorCode = e.code;
          String eMessage="";



          if (errorCode == 'email-already-in-use') {
            // E-posta adresi zaten kullanımda hatası

            eMessage='Bu e-posta adresi zaten kullanımda.';
            print(eMessage);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );
          } else if (errorCode == 'weak-password') {
            // Zayıf şifre hatası
            eMessage='Daha güçlü bir şifre seçiniz';
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );

          } else {
            // Diğer hata durumları
            print('Hata: $errorMessage');
            eMessage=errorMessage;
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );

          }
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

            Spacer(),
            SizedBox(width:scrWidth,height: 75
                ,
                child: ElevatedButton(onPressed: (){

                  registerUser(_email.text, _password.text);


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

