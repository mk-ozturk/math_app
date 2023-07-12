

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/OpeningScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';
import 'Pages/BottomBar.dart';
import 'firebase_options.dart';






Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CheckboxModel>(create: (_) => CheckboxModel()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {



    Future<Widget?> isUserOpen() async {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        print('Kullanıcı oturumu kapattı');
        return OpeningScreen();
      } else {
        print('Kullanıcı oturumu açtı: ${user.uid}');
        return BottomBar();
      }
    }





    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(170, 216, 230, 1.0)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: FutureBuilder<Widget?>(
          future: isUserOpen(),
          builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return  CircularProgressIndicator();

            } else {
              if (snapshot.hasError) {

                return Text('Hata: ${snapshot.error}');
              } else {
                return snapshot.data!;
              }
            }
          },
        ),
      ),
    );
  }
}

