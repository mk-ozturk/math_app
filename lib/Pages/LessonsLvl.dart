import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/colors.dart';

class LessonPage extends StatefulWidget {


  @override
  State<LessonPage> createState() => _LessonPageState();
  String topicTittle;

   LessonPage(this.topicTittle, {super.key});
}

class _LessonPageState extends State<LessonPage> {
  List<bool> checkBoxList = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;

    final scrWidth=screen.width;



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicTittle),
        backgroundColor: AppTheme().themColors[4],
      ),
      body: ListView.builder(
        itemCount: 10, // Liste öğelerinin sayısı
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                SizedBox(width: scrWidth*8/10,
                  child: ListTile(
                    title: Text('Öğe $index'), // Her öğenin başlığı
                    subtitle: Text('Konu Özetleri İçin Tıklayınız $index'), // Her öğenin açıklaması
                  ),
                ),
                Checkbox(value: checkBoxList[index], onChanged: (bool? value){
                  print("checke");
                  setState(() {
                    checkBoxList[index]=value ?? false;
                  });


                },)
              ],
            ),
          );
        },
      ),

    );
  }
}
