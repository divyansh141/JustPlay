import 'package:JustPlay/AudioPages/audioHome.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class NowPlaying extends StatefulWidget {
  String songName;
  NowPlaying({this.songName});
  @override
  _NowPlayingState createState() => _NowPlayingState(songName);
}

class _NowPlayingState extends State<NowPlaying> {
  String songName;

  _NowPlayingState(this.songName);
  Map data = {};
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  IconData playIcon = Icons.pause_circle_filled_rounded;
  bool isPlaying = true;

  play() async {
    return audioPlayer = await audioCache.play('$songName.mp3');
  }

  @override
  void initState() {
    // TODO: implement initState

    play();
    // audioPlayer.onAudioPositionChanged.listen((Duration duration) {
    //   setState(() {
    //     currentTime = duration.toString();
    //   });
    // });
    // audioPlayer.onDurationChanged.listen((Duration duration) {
    //   setState(() {
    //     endTime = duration.toString().split('.')[0];
    //   });
    // });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioCache.clearCache();
    audioPlayer.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NowPlaying',
          style: TextStyle(color: Colors.pink),
        ),
        iconTheme: IconThemeData(color: Colors.pink),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.blueGrey[900],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(
            playIcon,
            size: 50,
          ),
          onPressed: () {
            if (isPlaying) {
              audioPlayer.pause();
              setState(() {
                playIcon = Icons.play_circle_filled_rounded;
                isPlaying = false;
              });
            } else {
              audioPlayer.resume();
              setState(() {
                playIcon = Icons.pause_circle_filled_rounded;
                isPlaying = true;
              });
            }
          }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                Icons.headset,
                size: 150,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              songName,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
