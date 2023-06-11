import 'package:flutter/material.dart';

import '../themas/colors.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

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
        body: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(width: (scrWidth-35)/2,
                    child: TextField(onChanged: (name){},
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Ad"
                              ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(width: (scrWidth-35)/2,
                    child: TextField(onChanged: (name){},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Soyad"
                      ),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (name){},
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "E-Posta"
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (id){},
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Kullanıcı Adı"
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(onChanged: (name){},
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Şifre"
                ),),
            ),
            Spacer(),
            SizedBox(width:scrWidth,height: 75
                ,
                child: ElevatedButton(onPressed: (){

                },child: Text("Kayıt Ol"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: theme().themColors[0],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)
                      )
                  ),))
          ],

        ));
  }
}

