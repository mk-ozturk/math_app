import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/OpeningScreen.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';
import '../widgets&etc/colors.dart';

class SignPage extends StatefulWidget {


  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {


  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    var appBarHeight=AppBar().preferredSize.height;
    var defaultAvatar="lib/images/add_icon.png";


    String _id="";
    String _surname="";
    String _name="";
    String _email="";
    String _password="";



    void updateData(String selectedOption) {
      setState(() {
        Provider.of<CheckboxModel>(context, listen: false).avatarLink(selectedOption);
        print(CheckboxModel().ppLink);
      });
    }

    Future<dynamic> registerUser(BuildContext context, String email, String password,String name, String pPhoto) async {
      try {
        // User sing-up
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        if (user != null) {

          await userCredential.user?.updatePhotoURL(pPhoto);
          await user.updateDisplayName(name);
          print('Kullanıcı kaydedildi: $name');
        }

        print(pPhoto);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>OpeningScreen()), (route) => false);

        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(

              content: Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10),
                child: Text("Kayıt oluşturuldu. Giriş yapabilirsiniz.",style: TextStyle(fontSize: 20),),
              ),
              backgroundColor: Colors.green,

            ));

        // Kullanıcı başarıyla kaydedildi
      } catch (e) {
        if (e is FirebaseAuthException) {
          String errorMessage = e.message!;
          String errorCode = e.code;
          String eMessage="";



          if (errorCode == 'email-already-in-use') {
            // E-posta adresi zaten kullanımda hatası

            eMessage='E-posta adresi kullanımda';
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

          } else if (errorCode=="invalid-email") {
            // Diğer hata durumları
            print('Hata: $errorMessage');
            print(errorCode);
            eMessage="Geçerli bir e-posta adresi giriniz.";
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );

          }else{
            //other errors
            print('Hata: $errorMessage');
            print(errorCode);
            eMessage="Tüm alanları doldurunuz.";
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


  //body height
  double body(double screenW, double screenH, var appbarH){
    if (screenW<scrHeight){
      double bodyHeight= scrHeight-appbarH-MediaQuery.of(context).padding.top;
      return bodyHeight;
    }else{
      double bodyHeight=scrWidth-appbarH-MediaQuery.of(context).padding.top;
          return bodyHeight;}

  }



    return ChangeNotifierProvider(
        create: (context)=> CheckboxModel(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme().themColors[4],
              title: Text("Üye Ol"),
            ),
            body: SingleChildScrollView(
              child: Container(height: body(scrWidth, scrHeight, appBarHeight),
                child: Column(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("tapped");
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                          ),
                          builder: (context) {
                            return GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: theme().avatars.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      updateData(theme().avatars[index]);

                                      Navigator.pop(context);
                                    },
                                    child: ClipOval(
                                      child: Image.asset(
                                        theme().avatars[index],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Consumer<CheckboxModel>(
                        builder: (context, avatarProvider, child) {
                          return ClipOval(
                            child: Image.asset(
                              avatarProvider.ppLink ,
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(width: (scrWidth-35)/2,
                            child: TextField(
                              onChanged: (valueName){
                                _name=valueName;
                                print(_name);
                              },
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
                              onChanged: (valueSname){
                                _surname=valueSname;
                                print(_surname);
                              },
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
                        onChanged: (valueEmail){
                          _email=valueEmail;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "E-Posta"
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (valueId){
                          _id=valueId;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Kullanıcı Adı"
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (valuePass){
                          _password=valuePass;
                        },
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
                          String fullname=_name+" "+_surname;
                          print(fullname);

                          registerUser(context,_email, _password,fullname, defaultAvatar);


                        },child: Text("Kayıt Ol"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: theme().themColors[0],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)
                              )
                          ),))
                  ],

                ),
              ),
            ))
      );
  }
}

