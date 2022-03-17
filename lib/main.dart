import 'package:flutter/material.dart';
import 'package:musicaudioplayer/src/OnGeneratedRoute.dart';

import 'App.dart';

void main() {
  var materialApp = MaterialApp(
    //routes: ,// il nest pas conseille car il faudra mettre tout ce qui est logique et faudra mettre 
    //tout ce qui est route dans un fichier a part onGeneratedRoute.dart
    //rechercher le widget hero
    initialRoute: GenerateRoute.homeScreen,
    
    //le slash est primordial dans le initialRoute
    onGenerateRoute: GenerateRoute.generatedRoute,
    //eviter de mettre des homes dns le main les remplacer par les
    //3 routes ci-dessus
    title: 'Music Application',
    //home: Scaffold(backgroundColor: Colors.white, body: App()),
  );
  runApp(materialApp);
}
