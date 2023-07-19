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
    var appBarHeight=AppBar().preferredSize.height;
    String resPass="";




// User sign in
    Future<dynamic> signInUser(BuildContext context, String email, String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BottomBar()), (route) => false);

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
                  child: Text(eMessage,style: const TextStyle(fontSize: 20),),
                ),
                backgroundColor: AppTheme().themColors[6],

              ),
            );
          }else if (errorCode =="wrong-password" ){
            eMessage="E-posta adresi veya şifre yanlış.";
            print(errorCode);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: const TextStyle(fontSize: 20),),
                ),
                backgroundColor: AppTheme().themColors[6],

              ),
            );
          }else if (errorCode =="invalid-email"){
            eMessage="E-posta biçimi yanlış";
            print(errorMessage);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: const TextStyle(fontSize: 20),),
                ),
                backgroundColor: AppTheme().themColors[6],

              ),
            );

          }else if (errorCode=="unknown"){
            eMessage="E-posta ve şifre kısmı boş bırakılamaz";
            print(errorMessage);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: const TextStyle(fontSize: 18),),
                ),
                backgroundColor: AppTheme().themColors[6],

              ),
            );

          }else{
            eMessage=errorMessage;
            print(eMessage);
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text(eMessage,style: const TextStyle(fontSize: 20),),
                ),
                backgroundColor: AppTheme().themColors[6],

              ),
            );
          }
        }
      }
    }

//password res
    Future<dynamic> resPassword(String email) async {
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        print("$email adresine mail gönderildi");
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(

            content: Padding(
              padding:  EdgeInsets.only(top: 12.0,bottom: 12.4),
              child: Text("Şifreyi sıfırlamak için mail adresini kontrol ediniz.",style: TextStyle(fontSize: 15),),
            ),
            backgroundColor: Colors.green,

          ),
        );

      } catch(e){
        if (e is FirebaseAuthException){
          String errorMessage = e.message!;
          String errorCode = e.code;
          print(errorCode);
          print(errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(

                content: const Padding(
                  padding: EdgeInsets.only(top: 10.0,bottom: 10),
                  child: Text("E-posta adresi bulunamadı",style: TextStyle(fontSize: 20),),
                ),
                backgroundColor: AppTheme().themColors[6],

              ));
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
      create: (context)=> LogPageProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme().themColors[4],
          title: const Text("Math App"),
        ),
        body: SingleChildScrollView(
          child: SizedBox(height: body(scrWidth, scrHeight, appBarHeight),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(width: 150,height: 150,"lib/images/icon.png",),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<LogPageProvider>(
                    builder: (context, providerMail, child){
                      return TextField(
                        onChanged: (value){
                         providerMail.textMail(value);
                         print(providerMail.logMail);
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "E-posta"
                        ),);
                    }
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<LogPageProvider>(
                    builder: (context, providerPass, child){
                      return TextField(
                        onChanged: (value){
                          providerPass.textPass(value);
                          print(providerPass.logPass);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Şifre"
                        ),);


                    }

                  ),
                ),
               TextButton(onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              content: TextField(
                                onChanged: (value){
                                  resPass=value;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "E-posta adresini giriniz"
                                ),   ),
                              actions: [
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        print('Onaylandı');
                                        print("respas_work");
                                        resPassword(resPass);

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
                                ),
                              ],
                            );
                          });
               },
                   child: const Text("Şifremi unuttum")),
                const Spacer(),
                Consumer<LogPageProvider>(
                 builder: (context, textModel, child){
                   return SizedBox(height: 75,width: scrWidth,
                       child: ElevatedButton(onPressed: (){
                         print("button_working");
                         String logMail=textModel.logMail;
                         String logPass=textModel.logPass;
                         signInUser(context,logMail, logPass);
                       },
                           style: ElevatedButton.styleFrom(
                               backgroundColor: AppTheme().themColors[1],
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(0.0)
                               )
                           ),

                           child: (const Text("Giriş Yap"))));
                 },

                )


              ],
            ),
          ),
        ),

      ),
    );
  }
}
