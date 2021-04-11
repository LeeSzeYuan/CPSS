import 'package:cpss/services/alarm.dart';
import 'package:flutter/services.dart';
import 'package:noise_meter/noise_meter.dart';
import 'dart:async';

class Scream {
  bool isRecording = false;
  double reading;

  StreamSubscription<NoiseReading> _noiseSubscription;
  NoiseMeter _noiseMeter;

  Alarm alarm = Alarm();

  void onData(NoiseReading noiseReading) {
    if (!this.isRecording) {
      this.isRecording = true;
    }
    // print(noiseReading.toString());
    reading = noiseReading.maxDecibel;
  }

  void onError(PlatformException e) {
    print(e.toString());
    isRecording = false;
  }

  void start() async {
    _noiseMeter = new NoiseMeter(onError);

    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
        alarm.start();
    } catch (err) {
      print(err);
    }
  }

  void stop() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription.cancel();
        _noiseSubscription = null;
        alarm.stop();
      }
      this.isRecording = false;
    } catch (err) {
      print('stopRecorder error: $err');
    }
  }
}
