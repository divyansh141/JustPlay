import 'package:JustPlay/VideoPages/chewieList.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHome extends StatefulWidget {
  @override
  _VideoHomeState createState() => _VideoHomeState();
}

class _VideoHomeState extends State<VideoHome> {
  List playlist = ['Divyansh'];
  bool isPlaying;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPlaying = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                'Video Library',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: isPlaying == true
                  ? ChewieListItem(
                      videoPlayerController: VideoPlayerController.asset(
                        'assets/videos/Divyansh.mp4',
                      ),
                      looping: true,
                    )
                  : Text(
                      'PLAY THE VIDEO',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 600,
              decoration: BoxDecoration(
                color: Colors.blueGrey[800],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)),
              ),
              child: ListView.builder(
                itemCount: playlist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        setState(() {
                          if (isPlaying) {
                            isPlaying = false;
                          } else {
                            isPlaying = true;
                          }
                        });
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.pinkAccent[100],
                        child: Text(
                          playlist[index][0],
                          style: TextStyle(color: Colors.pink[900]),
                        ),
                      ),
                      title: Text(
                        playlist[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isPlaying) {
                              isPlaying = false;
                            } else {
                              isPlaying = true;
                            }
                          });
                        },
                        icon: Icon(
                          isPlaying ? Icons.stop : Icons.play_arrow_rounded,
                          size: 36,
                          color: Colors.pink,
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
