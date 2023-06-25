import 'package:flutter/material.dart';
import 'package:math_app/Pages/VideoList.dart';
import 'package:math_app/widgets&etc/colors.dart';

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
      body: ListView.builder(
        itemCount: 10, // Liste öğelerinin sayısı
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoList(index.toString())));
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
