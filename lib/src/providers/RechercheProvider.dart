import 'package:flutter/foundation.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';

class RechercheProvider with ChangeNotifier {
  List<Artist> allArtiste = [];

  changeStatus() {
    notifyListeners();
  }
}
