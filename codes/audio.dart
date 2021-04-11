import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Playing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Audio Player Testing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache audioCache = AudioCache();
  AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ElevatedButton(
            onPressed: () {
              player?.stop();
            },
            child: Text("Stop")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          audioCache.load('alarm.mp3');
          // audioCache.play('alarm.mp3');
          player = await audioCache.loop('alarm.mp3');
          // audioCahce.clearcache();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
