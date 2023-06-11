import 'package:flutter/material.dart';
import 'package:untitled3/Pages/OpeningScreen.dart';
import 'package:untitled3/themas/colors.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(170, 216, 230, 1.0)),
        useMaterial3: true,
      ),
      home: OpeningScreen(),
    );
  }
}

