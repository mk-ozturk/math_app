import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../themas/colors.dart';

class VideoFullScreen extends StatefulWidget {
  const VideoFullScreen({super.key});

  @override
  State<VideoFullScreen> createState() => _VideoFullScreenState();
}

class _VideoFullScreenState extends State<VideoFullScreen> {
  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );

    return Scaffold(
        appBar: AppBar(
        backgroundColor: theme().themColors[4],
    title: Text("Ana Sayfa"),
    ),
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
          ),
          builder: (context,player){
            return Column(
              children: [
                player
              ],
            );
          },

        ),
    );
  }
}
