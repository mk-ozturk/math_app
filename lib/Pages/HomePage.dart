import 'package:flutter/material.dart';
import 'package:math_app/themas/HomaPageWidgets.dart';
import 'package:math_app/themas/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme().themColors[4],
        title: Text("Ana Sayfa"),
      ),
      body: Column(
        children: [
          WelcomeSide(),
          NotfCallender()
        ],
      ),
    );
  }
}
