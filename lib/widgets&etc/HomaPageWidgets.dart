import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:math_app/widgets&etc/FirebaseFuncs.dart';
import 'package:math_app/widgets&etc/provider.dart';
import 'package:provider/provider.dart';
import 'colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NotfCallender extends StatelessWidget {
  const NotfCallender({super.key});

  @override
  Widget build(BuildContext context) {
    var screen=MediaQuery.of(context).size;
    final scrHeight=screen.height;
    final scrWidth=screen.width;
    return
      SizedBox(height: scrHeight/4,width: scrWidth-10,
        child: Card(color: AppTheme().themColors[5],
          child:
          const Center(
            child: Column(children: [
              Text(("gelecek bildirimler görülecek"))
            ],),
          ),),
      );
  }
}


class WelcomeSide extends StatelessWidget {
  const WelcomeSide({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>FirebaseModel(),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<FirebaseModel>(
            builder: (context, avatarModel, child){
              return
                ClipOval(
                  //burası çalışmıyor düzelecek
                  child: Image.asset(avatarModel.ppUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,),
                );
            },
          ),
          Column(
            children: [
              const Text("Hoş Geldin"),
              Text(getCurrentUserName().toString())
            ],)
        ],
      ),
    );
  }
}





class VideoSuggestion extends StatefulWidget {
  const VideoSuggestion({super.key});

  @override
  State<VideoSuggestion> createState() => _VideoSuggestionState();
}





class _VideoSuggestionState extends State<VideoSuggestion> {
  @override
  Widget build(BuildContext context) {

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: '36fta1dYCjY',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,

      ),
    );
    return CarouselSlider(
      options: CarouselOptions(height: 200.0, aspectRatio: 16/9, autoPlay: true),
      items: ["36fta1dYCjY","p2JU8tumYrI"].map((i) {
        YoutubePlayerController controller0 = YoutubePlayerController(
          initialVideoId: i,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
          ),
        );
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                decoration: const BoxDecoration(
                   color: Colors.lightBlueAccent
                ),
                child: YoutubePlayer(controller: controller0,

                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: const ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent
                  ),
                ),
            );
          },
        );
      }).toList(),
    )  ;
  }
}


