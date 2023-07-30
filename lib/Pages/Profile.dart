import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_app/Pages/OpeningScreen.dart';
import 'package:math_app/widgets&etc/ProfileWidgets.dart';
import 'package:math_app/widgets&etc/colors.dart';
import 'package:provider/provider.dart';
import '../widgets&etc/FirebaseFuncs.dart';
import '../widgets&etc/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();


}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
        create: (context)=>FirebaseModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Hesap Ayarları"),
            backgroundColor: AppTheme().themColors[4],
          ),
          body: const Center(child:
          Column(children: [
            Spacer(flex: 1,),
            profileInfo(),
            Spacer(flex: 1,),
            bottomSheetCard(),
            passReset(),
            feedBack(),
            Spacer(flex: 4,),
            notfDemo(),
            exit()
          ],
          )),

        ),);
  }
}
