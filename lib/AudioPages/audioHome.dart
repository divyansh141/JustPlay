import 'package:JustPlay/AudioPages/nowPlaying.dart';
import 'package:flutter/material.dart';

class AudioHome extends StatefulWidget {
  @override
  _AudioHomeState createState() => _AudioHomeState();
}

class _AudioHomeState extends State<AudioHome> {
  String songName;
  List playlist = [
    'All Falls Down',
    'Alone',
    'Asal Mein',
    'Astronomia',
    'Bella Ciao',
    'Coca Cola Tu',
    'Faded',
    'Guitar Sikhda',
    'Gulabi Aankhen',
    'Lean On',
    'Pretty Girl',
    'Tera Zikr',
    'Tere Bina Zindagi Se',
    'Tere Naal',
    'Wish',
    'Wishlist',
  ];

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
                'Audio Library',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
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
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            NowPlaying(songName: playlist[index]))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
