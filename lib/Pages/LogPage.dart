import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/BottomBar.dart';
import 'package:math_app/widgets&etc/FirebaseFuncs.dart';
import 'package:math_app/widgets&etc/colors.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    TextEditingController _logMail= TextEditingController();
    TextEditingController _logPass=TextEditingController();

// User sign in
    Future<dynamic> signInUser(BuildContext context, String email, String password, bool rememberMe) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        if (rememberMe) {
          await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
          print("remmeberme is $rememberMe");
          print('Kullanıcı girişi yapıldı: ${user!.uid}');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);

        } else {
          await FirebaseAuth.instance.setPersistence(Persistence.NONE);
          print("remmeberme is $rememberMe");
          print('Kullanıcı girişi yapıldı: ${user!.uid}');
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);

        }
      } catch (e) {
        if (e is FirebaseAuthException){
          String errorMessage = e.message!;
          String errorCode = e.code;
          String eMessage="";

          if (errorCode == "user-not-found"){
            eMessage="E-posta adresi veya şifre yanlış.";
            print(errorCode);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );
          }else if (errorCode =="wrong-password" ){
            eMessage="E-posta adresi veya şifre yanlış.";
            print(errorCode);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );
          }else if (errorCode =="invalid-email"){
            eMessage="E-posta biçimi yanlış";
            print(errorCode);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );

          }else if (errorCode=="unknown"){
            eMessage="E-posta ve şifre kısmı boş bırakılamaz";
            print(errorCode);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: TextStyle(fontSize: 18),),
                ),
                backgroundColor: theme().themColors[6],

              ),
            );

          }else{
            eMessage=errorMessage;
            print(errorCode);
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

    return ChangeNotifierProvider(
      create: (context)=> CheckboxModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme().themColors[4],
          title: Text("Math App"),
        ),
        body: Column(
          children: [
            Spacer(),
            Image.asset(width: 150,height: 150,"lib/images/flutter-2038877-1720090.png",),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (value){
                print(value);
              },
                controller: _logMail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-posta"
                ),),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (value){
                print(value);
              },
                controller: _logPass,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Şifre"
                ),),
            ),
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Giriş bilgilerimi hatırla."),
               Consumer<CheckboxModel>(
                 builder: (context, checkboxModel, child) {
                   return Checkbox(
                     value: checkboxModel.isChecked,
                     onChanged: (value) {
                       checkboxModel.toggleCheckbox();
                     },
                   );
                 },
               )
             ],
           ),
            Spacer(),
            SizedBox(height: 75,width: scrWidth,
                child: ElevatedButton(onPressed: (){
                  print("button_working");
                  signInUser(context,_logMail.text, _logPass.text,CheckboxModel().isChecked);


                }, child: (Text("Giriş Yap")),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme().themColors[1],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)
                        )
                    ))),


          ],
        ),

      ),
    );
  }
}
