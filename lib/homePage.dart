import 'package:JustPlay/AudioPages/audioHome.dart';
import 'package:JustPlay/VideoPages/VideoHome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List pageFunction = [AudioHome(), VideoHome()];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.stream),
        title: Text('JustPlay'),
        backgroundColor: Colors.blueGrey[900],
      ),
      backgroundColor: Colors.blueGrey[900],
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 0,
          viewportFraction: 1,
        ),
        items: pageFunction.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    // gradient: LinearGradient(colors: [
                    //   Colors.blue,
                    //   Colors.greenAccent,
                    // ], begin: Alignment.centerLeft),
                    borderRadius: BorderRadius.circular(12)),
                child: i,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
