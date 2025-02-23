import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = AudioCache(fixedPlayer: audioPlayer);

    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/forest.jpg'), fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(

                      icon: Icon(Icons.arrow_back, color: Colors.white,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Now Playing',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/forest.jpg'),
                        fit: BoxFit.cover)),
              ),
              const Spacer(),
              const Text(
                'Happier',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Text(
                'Marshmellow',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  audioCache.play('my_music.mp3');
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text('Play'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  audioPlayer.pause();
                },
                icon: const Icon(Icons.pause),
                label: const Text('Pause'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  audioPlayer.stop();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.stop),
                label: const Text('Stop'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildControl({Icon icon, Function onPressedFunction, String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 8, right: 10, top: 10),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 8),
              child: GestureDetector(onTap: onPressedFunction, child: icon),
            ),
            // IconButton(icon: icon, onPressed: onPressedFunction),
            Text(label)
          ],
        ),
      ),
    );
  }
}
