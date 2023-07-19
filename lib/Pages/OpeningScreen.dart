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

    final scrWidth=screen.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().themColors[4],

      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("lib/images/icon.png",fit:BoxFit.cover, width: 100,height: 100,),
            const Text("Welcome to Math App"),
            ],
    ),
          const Spacer(),
          Row(children: [
      SizedBox(width: scrWidth/2,height: 75,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogPage()));
          },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme().themColors[1],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)
                  )
              ), child: (const Text("Giriş Yap")))),
      SizedBox(width: scrWidth/2,height: 75
          ,
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme().themColors[0],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)
            )
          ),child: const Text("Kayıt Ol"),))
    ],)
        ],
      ));
  }
}
