import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {

  String videoTopicName;

  VideoPage(this.videoTopicName);


  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "p2JU8tumYrI",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    return  Scaffold(
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context, player){
            return Center(
                child: Column(
                  children: [
                    AppBar(
                      title: Text(widget.videoTopicName),
                      backgroundColor: theme().themColors[4],
                    ),
                    Spacer(),
                    player,
                    Spacer()
                  ],)
            );
          }          ,
        ),
      );;
  }
}
