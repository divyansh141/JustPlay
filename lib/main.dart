import 'package:JustPlay/AudioPages/nowPlaying.dart';
import 'package:JustPlay/HomePage.dart';
import 'package:JustPlay/VideoPages/VideoHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => HomePage(),
        'NowPlaying': (context) => NowPlaying(),
      },
    );
  }
}
