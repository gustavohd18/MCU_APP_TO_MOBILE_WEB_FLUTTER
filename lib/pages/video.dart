import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatelessWidget {
  final String url;
  Video(this.url);
  @override
  Widget build(BuildContext context) {
    final newURl = YoutubePlayer.convertUrlToId(url);
    return SafeArea(
        child: YoutubePlayerBuilder(
      onEnterFullScreen: () {
        // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
      },
      player: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: newURl,
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
    ));
  }
}
