import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentView extends StatefulWidget {
  Color contentBackColor;
  String imageUrl;
  String title;
  String subTitle;

  ContentView(
      {super.key,
      required this.contentBackColor,
      required this.imageUrl,
      required this.title,
      required this.subTitle});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.contentBackColor,
      body: Stack(
        children: [
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.57,
            right: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset(
              'assets/spot.png',
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          Center(
            child: Column(
              children: [
                Image.asset(
                  widget.imageUrl,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.subTitle,
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
