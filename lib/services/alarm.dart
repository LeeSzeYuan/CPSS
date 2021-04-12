import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Alarm {
  AudioCache audioCache = AudioCache();
  AudioPlayer player;

  bool isPlay = false;

  void start() async {
    isPlay = true;
    audioCache.load('alarm.mp3');
    player = await audioCache.loop('alarm.mp3');
    Fluttertoast.showToast(  
        msg: 'Alarm is activated',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.red,  
        textColor: Colors.white  
    ); 
  }

  void stop() async {
    isPlay = false;
    player?.stop();
    Fluttertoast.showToast(  
        msg: 'Alarm is turned off',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.green,  
        textColor: Colors.white  
    ); 
  }
}
