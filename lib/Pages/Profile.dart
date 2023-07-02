import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/OpeningScreen.dart';
import 'package:math_app/widgets&etc/colors.dart';
import '../widgets&etc/FirebaseFuncs.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {






  //user status
    void userStatus(BuildContext context) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('Oturum açık değil');

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OpeningScreen()), (route) => false);



        } else {
          print('Kullanıcı oturumu açtı: ${user.uid}');
        }
      });
    }

    //password reset
    void changePassword(BuildContext context, String email) async {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        print('Şifre değiştirme e-postası gönderildi.');
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(

            content: Padding(
              padding: const EdgeInsets.only(top: 12.0,bottom: 12.4),
              child: Text("E-posta adresinize mail gönderildi",style: TextStyle(fontSize: 15),),
            ),
            backgroundColor: Colors.green,

          ),
        );
      } catch (e) {

        print('Şifre değiştirme işlemi başarısız: $e');
      }
    }







    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap Ayarları"),
        backgroundColor: theme().themColors[4],
      ),
      body: Center(child:
        Column(children: [
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset("lib/images/icon.png",
              width: 150,
              height: 150,
              fit: BoxFit.cover,),

            ),
          ),
          Text(getCurrentUserName().toString(),style: TextStyle(fontSize: 25),),
          Text(getCurrentUserEmail().toString(),style: TextStyle(fontSize: 15),),
          Spacer(flex: 1,),
          GestureDetector(
            onTap: (){},
            child: const Row(
              children: [
                Expanded(child: Card(child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("E-posta Değiştir",style: TextStyle(fontSize: 20),),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
                )
                ),
              ],
            ),
          ),
           GestureDetector(
             onTap: (){print("working buton");
             showDialog(
                 context: context,
                 builder: (BuildContext context){
                   return AlertDialog(
                     content: const Padding(
                       padding:  EdgeInsets.only(top:8.0),
                       child: Text("Şifre sıfırlamak için E-posta adresinize bir mail gönderilmesini isriyor musunuz",
                                      style: TextStyle(fontWeight: FontWeight.bold),),
                     ),
                     actions: [  Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         TextButton(
                           onPressed: () {
                             print('Onaylandı');
                             changePassword(context,getCurrentUserEmail().toString());
                           },
                           child: Text('Şifreyi sıfırla'),
                         ),
                         TextButton(
                           onPressed: () {
                             Navigator.of(context).pop();
                             print('Reddedildi');
                           },
                           child: const Text('Geri'),
                         ),

                       ],
                     ),],
                   );


                 });},
             child: const Row(
              children: [
                Expanded(child: Card(child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:Text("Şifre Değiştir",style: TextStyle(fontSize: 20))
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),)),
              ],
          ),
           ),
          GestureDetector(
              onTap: (){},
            child: const Row(
              children: [
                Expanded(child: Card(child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Sorun Bildir",style: TextStyle(fontSize: 20),),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
                )
                ),
              ],
            ),
          ),
          Spacer(flex: 4,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text('Çıkış yapmak istiyor musunuz?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              print('Onaylandı');
                              print("logout çalıştı");
                              signOutUser();
                              userStatus(context);
                               },
                            child: Text('Evet'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              print('Reddedildi');
                            },
                            child: Text('Hayır'),
                          ),
                        ],
                      );
                    },
                  );

                },
                child: Text("Çıkış Yap", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
          )

        ],
        )),

    );
  }
}
