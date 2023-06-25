import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:math_app/Pages/VideoFullScreen.dart';
import 'colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: '36fta1dYCjY',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,

      ),
    );
    return CarouselSlider(
      options: CarouselOptions(height: 200.0, aspectRatio: 16/9, autoPlay: true),
      items: ["36fta1dYCjY","p2JU8tumYrI"].map((i) {
        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: "$i",
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
          ),
        );
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                   color: Colors.lightBlueAccent
                ),
                child: YoutubePlayer(controller: _controller,

                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent
                  ),
                ),
            );
          },
        );
      }).toList(),
    )  ;
  }
}


