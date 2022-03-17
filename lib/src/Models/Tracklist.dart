class Tracklist {
  String _title;
  bool isPlaying = false;
  String _preview;
  int _duration;
  String _imageUrlMusic;
  int _artistID;

  //constructeur
  Tracklist(this._title, this._duration, this._preview, this._artistID);

  Tracklist.fromjson(Map<String, dynamic> json) {
    _title = json["title"];
    _duration = json["duration"];
    _preview = json["preview"];
    _artistID = json["artist"]["id"]; //id artist
    _imageUrlMusic = json["album"]["cover_small"];
  }
  setIsPlaying() {
    isPlaying = !isPlaying;
  }

  String get title => _title;
  int get duration => _duration;
  String get preview => _preview;
  String get imageMusic => _imageUrlMusic;
  int get artistID => _artistID; //ajout getter idartist


  // Methode fromMap()
  Tracklist.fromMap(Map<String, dynamic> map) {
    _title = map["title"];
    _duration = map["duration"];
    _preview = map["preview"];
    _imageUrlMusic = map["image"];
    _artistID = map["artistID"];
  }

  //Methode toMap()
  Map<String, dynamic> TracklistToMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map["title"] = this._title;
    map["duration"] = this._duration;
    map['preview'] = this._preview;
    map['album'] = this._imageUrlMusic;
    map["artistID"] = this._artistID;

    return map;
  }
}
