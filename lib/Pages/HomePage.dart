import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/HomaPageWidgets.dart';
import 'package:math_app/widgets&etc/colors.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().themColors[4],
        title: const Text("Ana Sayfa"),
      ),
      body: const Column(
        children: [
          WelcomeSide(),
          NotfCallender(),
          //VideoSuggestion(),
        ],
      ),
    );
  }
}
