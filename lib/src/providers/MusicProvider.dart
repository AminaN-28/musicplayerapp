import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MusicProvier extends ChangeNotifier {
  bool isPlaying = false;
  Icon icon = Icon(Icons.play_circle_fill_outlined);
  AudioPlayer audioPlayer = new AudioPlayer();

  playSound(String url) {
    isPlaying = !isPlaying;
    if (!isPlaying) {
      audioPlayer.stop();
      icon = Icon(Icons.play_circle_fill_outlined);
      notifyListeners();
    } else {
      icon = Icon(Icons.pause_circle_filled);
      audioPlayer.play(url);
      notifyListeners();
    }
  }
}
