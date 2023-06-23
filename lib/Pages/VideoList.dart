import 'package:flutter/material.dart';
import 'package:math_app/Pages/VideosPage.dart';
import 'package:math_app/themas/colors.dart';

class VideoList extends StatefulWidget {

  String videoTopic;


  VideoList(this.videoTopic);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoTopic),
        backgroundColor: theme().themColors[4],
      ),
      body:  ListView.builder(
        itemCount: 10, // Liste öğelerinin sayısı
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPage(index.toString())));
            },
            child: Card(
              child: ListTile(
                title: Text('Öğe $index'), // Her öğenin başlığı
                subtitle: Text('Konu Özetleri İçin Tıklayınız $index'), // Her öğenin açıklaması
              ),
            ),
          );
        },
      ),
    );
  }
}
