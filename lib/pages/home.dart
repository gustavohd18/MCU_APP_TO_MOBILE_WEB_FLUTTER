import 'package:flutter/material.dart';
import 'package:mcu_app/repository/data.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatelessWidget {
  final firstMovies = ironMan;

  Widget youtubePlayer() {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: 'xXAdp_KJ-0A',
          flags: YoutubePlayerFlags(
            hideControls: false,
            controlsVisibleAtStart: true,
            autoPlay: false,
            mute: false,
          ),
        ),
        aspectRatio: 16 / 9,
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: NetworkImage(
              firstMovies.backgroundImage,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 100, left: 30),
                  child: Text(
                    firstMovies.name,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(
                          Icons.play_circle_fill_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          print("chamei a funcao");
                          //  getVideo();
                        },
                      ))),
              Padding(
                padding: EdgeInsets.only(top: 200, left: 10),
                child: Text(
                  "Linha temporal MCU",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.transparent),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0)),
                          child: Image.network(
                            firstMovies.mainImage,
                            fit: BoxFit.fill,
                            width: 120,
                            height: 200,
                          ),
                        ),
                      ),
                      Divider(
                        height: 15,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
              Center(
                child: Text(
                  "Veja mais",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
