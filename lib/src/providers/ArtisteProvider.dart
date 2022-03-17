import 'package:flutter/foundation.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';

class ArtistProvider with ChangeNotifier {
  List<Artist> _artist = [];

  getUpdateArtist() {
   
    notifyListeners();
  }

  List<Artist> get getArtiste => _artist;

  setArtisteMusic(List<Artist> artist) {
    _artist = artist;
  }
}
