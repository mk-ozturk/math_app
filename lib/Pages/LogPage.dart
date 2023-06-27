import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/BottomBar.dart';
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
    String _logMail="";
    String _logPass="";
    String _resPass="";

// User sign in
    Future<dynamic> signInUser(BuildContext context, String email, String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);

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


    Future<dynamic> resPassword(String email) async {
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        print("$email adresine mail gönderildi");
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(

            content: Padding(
              padding: const EdgeInsets.only(top: 12.0,bottom: 12.4),
              child: Text("Şifreyi sıfırlamak için mail adresini kontrol ediniz.",style: TextStyle(fontSize: 15),),
            ),
            backgroundColor: Colors.green,

          ),
        );

      } catch(e){
        if (e is FirebaseAuthException){
          String errorMessage = e.message!;
          String errorCode = e.code;
          String eMessage="";
          print(errorCode);
          print(errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text("E-posta adresi bulunamadı",style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: theme().themColors[6],

              ));



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
              child: TextField(
                onChanged: (valueMail){

                  _logMail=valueMail;
                print(valueMail);
              },
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-posta"
                ),),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (value){
                _logPass=value;
                print(value);
              },

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Şifre"
                ),),
            ),
           Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Consumer<CheckboxModel>(
                 builder: (context, checkboxModel, child) {
                   return Checkbox(
                     value: checkboxModel.isChecked,
                     onChanged: (value) {
                       checkboxModel.toggleCheckbox();
                     },
                   );
                 },
               ),
               Text("Giriş bilgilerimi hatırla."),

               TextButton(onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              content: TextField(
                                onChanged: (value){
                                  _resPass=value;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "E-posta adresini giriniz"
                                ),   ),
                              actions: [
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        print('Onaylandı');
                                        print("logout çalıştı");
                                        resPassword(_resPass);

                                      },
                                      child: Text('Şifreyi sıfırla'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        print('Reddedildi');
                                      },
                                      child: Text('Geri'),
                                    ),

                                  ],
                                ),


                              ],

                            );

                          });
               },
                   child: Text("Şifremi unuttum")),
             ],
           ),
            const Spacer(),
            SizedBox(height: 75,width: scrWidth,
                child: ElevatedButton(onPressed: (){
                  print("button_working");
                  signInUser(context,_logMail, _logPass);


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
