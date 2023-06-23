import 'package:flutter/material.dart';
import 'package:math_app/themas/colors.dart';

class LessonsLvlPage extends StatefulWidget {


  @override
  State<LessonsLvlPage> createState() => _LessonsLvlPageState();
  String topicTittle;

   LessonsLvlPage(this.topicTittle);
}

class _LessonsLvlPageState extends State<LessonsLvlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicTittle),
        backgroundColor: theme().themColors[4],
      ),
      body: ListView.builder(
        itemCount: 10, // Liste öğelerinin sayısı
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Öğe $index'), // Her öğenin başlığı
              subtitle: Text('Konu Özetleri İçin Tıklayınız $index'), // Her öğenin açıklaması
            ),
          );
        },
      ),

    );
  }
}
