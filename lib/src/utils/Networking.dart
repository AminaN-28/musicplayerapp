import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:musicaudioplayer/src/Models/Tracklist.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';

class Networking {
  static String url = "https://api.deezer.com/artist/27";

  static Future<Artist> getSoundMusic() async {
    var reponse = await http.get(Uri.parse(url));
    print("yok");
    Map data = jsonDecode(reponse.body);

    Artist artist = Artist.fromjson(data);

    print("------------------------");
    print(artist.tracklist);

    var reponsetrack = await http.get(Uri.parse(artist.tracklist));
    var repTracklistJson = jsonDecode(reponsetrack.body);

    for (var music in repTracklistJson['data']) {
      Tracklist list = Tracklist.fromjson(music);
      artist.artistTracklist.add(list);
    }

    return artist;
  }

  static Future<Artist> getMusicBasedOnArtistName(String artisteName) async {
    print('TESTERrrrrrrrrrr');
    if (artisteName == "null") {
      return null;
    }
    print("Networking");
    String urlRequest = "https://api.deezer.com/search?q=$artisteName";
    var reponse = await http.get(Uri.parse(urlRequest));
    var responseJson = jsonDecode(reponse.body);
    for (var a in responseJson["data"]) {
      if (a["artist"]["name"]
          .toString()
          .toUpperCase()
          .contains(artisteName.toUpperCase())) {
        Artist artist = Artist.fromjson(a["artist"]);

         var reponsetrack = await http.get(Uri.parse(artist.tracklist));
    var repTracklistJson = jsonDecode(reponsetrack.body);

    for (var music in repTracklistJson['data']) {
      Tracklist list = Tracklist.fromjson(music);
      artist.artistTracklist.add(list);
    }

        return artist;
      }
    }
  }
}
