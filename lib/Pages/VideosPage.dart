import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {

  String videoTopicName;

  VideoPage(this.videoTopicName, {super.key});


  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: "p2JU8tumYrI",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    return  Scaffold(
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller,
          ),
          builder: (context, player){
            return Center(
                child: Column(
                  children: [
                    AppBar(
                      title: Text(widget.videoTopicName),
                      backgroundColor: AppTheme().themColors[4],
                    ),
                    const Spacer(),
                    player,
                    const Spacer()
                  ],)
            );
          }          ,
        ),
      );
  }
}
