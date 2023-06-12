import 'package:flutter/material.dart';
import 'package:untitled3/themas/colors.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videolar"),
        backgroundColor: theme().themColors[4]
      ),
    );
  }
}
