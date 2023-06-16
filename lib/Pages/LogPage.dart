import 'package:flutter/material.dart';
import 'package:math_app/Pages/BottomBar.dart';
import 'package:math_app/themas/colors.dart';

class LogPage extends StatelessWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme().themColors[4],
        title: Text("Math App"),
      ),
      body: Column(
        children: [
          Spacer(),
          Image.asset(width: 150,height: 150,"lib/images/flutter-2038877-1720090.png",),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(onChanged: (id){},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Kullanıcı Adı"
              ),),
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(onChanged: (id){},
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Şifre"
              ),),
          ),
          Spacer(),
          SizedBox(width: scrWidth,height: 75,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
              }, child: (Text("Giriş Yap")),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme().themColors[1],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      )
                  ))),


        ],
      ),

    );
  }
}
