import 'package:flutter/material.dart';

import '../themas/colors.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: theme().themColors[4],
        title: Text("Demo Page"),
      ),
      body: Center(child:Text("demo2")),
    );
  }
}
