import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/FirebaseFuncs.dart';
import 'package:math_app/widgets&etc/NotificationDemo.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Pages/OpeningScreen.dart';
import 'colors.dart';

class bottomSheetCard extends StatefulWidget {
  const bottomSheetCard({super.key});

  @override
  State<bottomSheetCard> createState() => _bottomSheetCardState();
}

class _bottomSheetCardState extends State<bottomSheetCard> {

  void ppUpdate(String newUrl) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      user.updatePhotoURL(newUrl).then((_) {
        // update succes
        print("Profil fotoğrafı güncellendi.");
        // _ppUrl değişkenini güncelle
        Provider.of<FirebaseModel>(context, listen: false).firebasePP(newUrl);
        Provider.of<FirebaseModel>(context, listen: false).homePpp(newUrl);
      }).catchError((error) {
        // error message
        print("Hata: $error");
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
          ),
          builder: (context) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: AppTheme().avatars.length,
              itemBuilder: (BuildContext context, int index) {
                String avatar = AppTheme().avatars[index];
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GestureDetector(
                    onTap: () {
                      ppUpdate(avatar);
                      Navigator.pop(context);
                    },
                    child: ClipOval(
                      child: Image.asset(avatar),
                    ),
                  )
                );
              },
            );
          },
        );
      },
      child: const Row(
        children: [
          Expanded(
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Fotoğrafı değiştir.", style: TextStyle(fontSize: 20)),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class passReset extends StatefulWidget {
  const passReset({super.key});

  @override
  State<passReset> createState() => _passResetState();
}

class _passResetState extends State<passReset> {

  //password reset
  void changePassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Şifre değiştirme e-postası gönderildi.');
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(

          content: Padding(
            padding: EdgeInsets.only(top: 12.0,bottom: 12.4),
            child: Text("E-posta adresinize mail gönderildi",style: TextStyle(fontSize: 15),),
          ),
          backgroundColor: Colors.green,

        ),
      );
    } catch (e) {

      print('Şifre değiştirme işlemi başarısız: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){print("working buton");
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              content: const Padding(
                padding:  EdgeInsets.only(top:8.0),
                child: Text("Şifre sıfırlamak için E-posta adresinize bir mail gönderilmesini istiyor musunuz?",
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              actions: [  Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      print('Onaylandı');
                      changePassword(context,getCurrentUserEmail().toString());
                    },
                    child: const Text('Şifreyi sıfırla'),
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
    );
  }
}




class exit extends StatelessWidget {
  const exit({super.key});

  //user status
  void userStatus(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Oturum açık değil');

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const OpeningScreen()), (route) => false);



      } else {
        print('Kullanıcı oturumu açtı: ${user.uid}');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
          onTap: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: const Text('Çıkış yapmak istiyor musunuz?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        print('Onaylandı');
                        print("logout çalıştı");
                        signOutUser();
                        userStatus(context);
                      },
                      child: const Text('Evet'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        print('Reddedildi');
                      },
                      child: const Text('Hayır'),
                    ),
                  ],
                );
              },
            );

          },
          child: const Text("Çıkış Yap", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
    );
  }
}

class profileInfo extends StatelessWidget {
  const profileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(Provider.of<FirebaseModel>(context).ppUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,),
          )
        ),
        Text(getCurrentUserName().toString(),style: const TextStyle(fontSize: 25),),
        Text(getCurrentUserEmail().toString(),style: const TextStyle(fontSize: 15),),
      ],
    );
  }
}



class feedBack extends StatelessWidget {
  const feedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          launchUrl(Uri.parse("mailto:kemal7991@hotmail.com"));
      },
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
    );
  }
}


class notfDemo extends StatelessWidget {
  const notfDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: (){
      NotificationService()
          .showNotification(title: "demo",body: "works");
    },
        child: Text("demo notf"));
  }
}




