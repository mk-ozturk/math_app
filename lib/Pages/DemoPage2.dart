import 'package:flutter/material.dart';

import '../themas/colors.dart';

class DemoPage2 extends StatefulWidget {
  const DemoPage2({Key? key}) : super(key: key);

  @override
  State<DemoPage2> createState() => _DemoPage2State();
}

class _DemoPage2State extends State<DemoPage2> {
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
