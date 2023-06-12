import 'package:flutter/material.dart';
import 'package:untitled3/themas/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap"),
        backgroundColor: theme().themColors[4],
      ),
      body: Center(child:
        Column(children: [
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset("lib/images/flutter-2038877-1720090.png",
              width: 150,
              height: 150,
              fit: BoxFit.cover,),

            ),
          ),
          Text("İsim Soyisim",style: TextStyle(fontSize: 25),),
          Spacer(flex: 1,),
          const Row(
            children: [
              Expanded(child: Card(child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("E-posta Değiştir",style: TextStyle(fontSize: 20),),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              )
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(child: Card(child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Şifre Değiştir",style: TextStyle(fontSize: 20),),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),)),
            ],
          ),
          const Row(
            children: [
              Expanded(child: Card(child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sorun Bildir",style: TextStyle(fontSize: 20),),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
              )
              ),
            ],
          ),
          Spacer(flex: 4,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
                onTap: (){
                  print("logout çalıştı");
                },
                child: Text("Çıkış Yap", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
          )

        ],
        )),

    );
  }
}
