

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/OpeningScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:math_app/widgets&etc/NotificationDemo.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';
import 'Pages/BottomBar.dart';
import 'firebase_options.dart';






Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LogPageProvider>(create: (_) => LogPageProvider()),
        ChangeNotifierProvider<SignPageModel>(create: (_) => SignPageModel()),
        ChangeNotifierProvider<FirebaseModel>(create: (_) => FirebaseModel()),
      ],
      child: const MyApp(),
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
        print('Kullanıcı oturumu kapalı');
        return const OpeningScreen();
      } else {
        print('Kullanıcı oturumu açtı: ${user.uid}');
        return const BottomBar();
      }
    }





    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(170, 216, 230, 1.0)),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: FutureBuilder<Widget?>(
          future: isUserOpen(),
          builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {

              return  const CircularProgressIndicator();

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

