import 'package:flutter/material.dart';

import 'colors.dart';

class NotfCallender extends StatelessWidget {
  const NotfCallender({super.key});

  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    return
      SizedBox(height: scrHeight/4,width: scrWidth-10,
        child: Card(color: theme().themColors[5],
          child:
          Center(
            child: Column(children: [
              Text(("gelecek bildirimler görülecek"))
            ],),
          ),),
      );
  }
}


class WelcomeSide extends StatelessWidget {
  const WelcomeSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Image.asset("lib/images/flutter-2038877-1720090.png",
            width: 150,
            height: 150,
            fit: BoxFit.cover,),
        ),
        Container(child:
          Column(
            children: [
            Text("Hoş Geldin"),
            Text("İsim")
          ],),
        )
      ],
    );
  }
}

class VideoSuggestion extends StatefulWidget {
  const VideoSuggestion({super.key});

  @override
  State<VideoSuggestion> createState() => _VideoSuggestionState();
}

class _VideoSuggestionState extends State<VideoSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("asda"),)  ;
  }
}


