import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class Alarm {
  AudioCache audioCache = AudioCache();
  AudioPlayer player;

  bool isPlay = false;

  void start() async {
    isPlay = true;
    audioCache.load('alarm.mp3');
    player = await audioCache.loop('alarm.mp3');
  }

  void stop() async {
    isPlay = false;
    player?.stop();
  }
}
