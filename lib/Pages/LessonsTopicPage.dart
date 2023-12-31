import 'package:flutter/material.dart';
import 'package:math_app/Pages/LessonsLvl.dart';

import '../widgets&etc/colors.dart';

class LessonsTopicPage extends StatefulWidget {
  const LessonsTopicPage({Key? key}) : super(key: key);

  @override
  State<LessonsTopicPage> createState() => _LessonsTopicPageState();
}

class _LessonsTopicPageState extends State<LessonsTopicPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme().themColors[4],
        title: const Text("Konular"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (contex)=>LessonPage(index.toString())));
              print("pushed");
            },
            child: Card(
              child: ListTile(
                title: Text('Konu Adı $index'),
                subtitle: Text('Konualt başlıkları $index'),

              ),
            ),
          );
        },
      )
    );
  }
}
