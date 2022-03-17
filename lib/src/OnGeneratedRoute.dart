
import 'package:flutter/material.dart';
import 'package:musicaudioplayer/App.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:musicaudioplayer/src/Page404.dart';

import 'package:musicaudioplayer/src/Screens/ArtisteHomeMusic.dart';

class GenerateRoute {
  //declarer l'ensemble des pages et mettre juste le chemin
  static const String homeScreen = "/"; // La page d'accueil est nommee /
  static const String artisteHomeMusic = "/artiste";
  // les variables doivent etre de type static et
  //des constantes egalement vu que le chemin ne change pas

  //declarer une classe de type route
  //au niveau de cette variable (settings)qu'on va mettre les
  //il faut donc eviter les NameRoute
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        {
          return MaterialPageRoute(builder: (context) => App());
        }
      case artisteHomeMusic:
        {
          Artist artist = settings.arguments;

          return PageRouteBuilder(
              pageBuilder: (_, __, ___) => ArtisteHomeMusic(artist)
                        ,transitionDuration : Duration(seconds: 2));
          /*return MaterialPageRoute(
              builder: (context) => ArtisteHomeMusic(artist));*/
        }
      default:
        return MaterialPageRoute(builder: (context) => Page404());
    }
  }
}
