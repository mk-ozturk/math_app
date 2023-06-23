import 'package:flutter/material.dart';
import 'package:math_app/themas/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "p2JU8tumYrI",
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
    return Scaffold(
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player){
          return Center(
            child: Column(
              children: [
                AppBar(
                  title: Text("video_name"),
                  backgroundColor: theme().themColors[4],
                ),
                Spacer(),
                player,
                Spacer()
            ],)
          );
        }          ,
      ),
    );
  }
}
