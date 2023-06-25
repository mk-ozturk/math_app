import 'package:flutter/material.dart';
import 'package:math_app/widgets&etc/colors.dart';

class LessonsLvlPage extends StatefulWidget {


  @override
  State<LessonsLvlPage> createState() => _LessonsLvlPageState();
  String topicTittle;

   LessonsLvlPage(this.topicTittle);
}

class _LessonsLvlPageState extends State<LessonsLvlPage> {
  List<bool> checkBoxList = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;



    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topicTittle),
        backgroundColor: theme().themColors[4],
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
                  print("checked");
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
