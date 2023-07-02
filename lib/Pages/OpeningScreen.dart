import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/colors.dart';

import 'LogPage.dart';
import 'SignPage.dart';


class OpeningScreen extends StatefulWidget {
  const OpeningScreen({Key? key}) : super(key: key);

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme().themColors[4],
        title: Text("Demo Page"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("lib/images/icon.png",fit:BoxFit.cover, width: 100,height: 100,),
            Text("Welcome to Math App"),
            ],
    ),
          Spacer(),
          Row(children: [
      SizedBox(width: scrWidth/2,height: 75,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LogPage()));
          }, child: (Text("Giriş Yap")),
              style: ElevatedButton.styleFrom(
                  backgroundColor: theme().themColors[1],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)
                  )
              ))),
      SizedBox(width: scrWidth/2,height: 75
          ,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignPage()));
          },child: Text("Kayıt Ol"),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme().themColors[0],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)
            )
          ),))
    ],)
        ],
      ));
  }
}
