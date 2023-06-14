import 'package:flutter/material.dart';
import 'package:untitled3/themas/colors.dart';

class VideoTopicPage extends StatefulWidget {
  const VideoTopicPage({Key? key}) : super(key: key);

  @override
  State<VideoTopicPage> createState() => _VideoTopicPageState();
}

class _VideoTopicPageState extends State<VideoTopicPage> {
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
