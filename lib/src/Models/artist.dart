

import 'package:musicaudioplayer/src/Models/Tracklist.dart';

class Artist {
  String _name;
  String _img;
  String _tracklist;
  int _nbAlbum;
  int _artistID; //ajouter id artiste pour bd local

  List<Tracklist> artistTracklist = [];

  //"CREATE TABLE artiste (idArtist integer primary key autoincrement, name Text, picture_big Text)");

  // Artist(this._name, this._img, this._nbAlbum, this._tracklist);

  Artist(this._name, this._img, this._artistID);

  Artist.fromjson(Map<String, dynamic> json) {
    _name = json["name"];
    _img = json["picture_big"];
    _tracklist = json["tracklist"];
    _nbAlbum = json["nb_album"];
    _artistID = json["id"];
  }
  String get name => _name;
  String get urlimage => _img;
  String get tracklist => _tracklist;
  int get nbalbum => _nbAlbum;
  int get artistID => _artistID; //ajouter le getteur de l'id 



/*Les données de votre base de données seront converties en Maps.
 Nous devons donc créer le modele avec les méthodes toMap et fromMa*/
  Artist.fromMap(Map<String, dynamic> map) 
  {
    _artistID = map["id"];
    _name = map["name"];
    _img = map["picture_big"];
  }

  Map<String, dynamic> ArtistToMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["id"] = this._artistID;
    map["name"] = this._name;
    map["picture_big"] = this._img;
    return map;
  }

}

  /*Map<String, dynamic> toFromMap(Map<String, dynamic> map) {
    this._name = map["name"];
    this._img = map["picture_big"];
    this._tracklist = map["tracklist"];
  }*/

  /*Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["picture_big"] = urlimage;
    map["tracklist"] = tracklist;

    return map;
  }*/

  