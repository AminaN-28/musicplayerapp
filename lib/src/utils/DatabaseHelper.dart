import 'dart:io';

import 'package:musicaudioplayer/src/Models/Tracklist.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:path/path.dart';

class DatabaseHelper {
  static Database _database;

  static Future<Database> get database async {
    print(
        '---------------------DATABASE GETTER CALLED-------------------------');
    if (_database == null) {
      Directory documentDirectory = await getApplicationDocumentsDirectory();
      //pour recuperer le dossier ou se trouve ts les fichiers de notre application
      String path = join(documentDirectory.path, "music.db");
      //path va directement pointer sur notre appplication
      return openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          print('---------------DATABASE CREATED--------------');
          await db.execute(
            "CREATE TABLE artist (id INTEGER PRIMARY KEY, name TEXT, picture_big TEXT)");
          db.execute(
           "CREATE TABLE tracklist (idTracklist integer primary key autoincrement,title Text, duration integer, preview Text, album Text,idArtist integer foreign key)");
        },
        /*onUpgrade: mettre a jour la version de la base*/
      );
    }
    return _database;
  }

  //Insertion avec rawInsert
  /*newArtist(Artist artist) async {
    final db = await database;
    var res = await db
        .rawInsert("INSERT Into artistTable (name,picture_big,tracklist)"
            " VALUES (${artist.name},${artist.urlimage}, ${artist.tracklist})");
    return res;
  }*/

/*static Future<void> insertArtist(Artist artist) async {
    var client = await database;
    //database cest le getteur qu'on a utilisé plus haut
    //on insere ce qu'on a mappe en faisaint appel a la methode ArtistToMap de
    //la classe Artist
    
    await client.insert("Artiste",artist.ArtistToMap());
  }

*/
  
  
   static Future<int> inserArtist(Artist artist) async {
    print('---------insert artist------------');
    var client = await database;
    try 
    {
      int val = await client.insert("artist", artist.ArtistToMap());
      if (val > 0) 
      {
        print('artist ok ${val}');
        return val;
      } 
      else 
      {
        print('artist ko ${val}');
      }
    } 
    on DatabaseException catch (e) 
    {
      print(e.toString());
      return 0;
    }
  }


  //insertion tracklist
   static Future<int> inserTracklist(Tracklist tracklist) async 
   {
    print('---------insert tracklist------------');
    var client = await database;
    int val = await client.insert("tracklist", tracklist.TracklistToMap());
    if (val > 0) 
    {
      print('tracklist insertion OK ${val}');
    } 
    else
    {
      print('tracklist insertion OK ${val}');
    }
    return val;
  }


 /* insertTracklist(Tracklist tracklist) async {
    var client = await database;
    return client.insert("Tracklist", tracklist.TracklistToMap());
  }*/

//method for retrieve list of artists
//methode pour recuperer tous les artistes
  static Future<List<Artist>> get_All_Artits() async {
    Artist artist;
    List<Artist> listArtist = [];
    var client = await database;
    List<Map> resultat = await client.rawQuery("SELECT * from artist");
    print('---------select artist- 0-----------');
    for (var tup in resultat) {
      //faire appel a la methode de la class artist 
      //dans laquelle on a mappe

      artist = Artist.fromMap(tup);
      //ajouter le map a la liste des artistes creer
      listArtist.add(artist);
    }
    //retourner une liste d'artistes
    return listArtist;
    
   /* Meme chose que boucle for artist.forEach((currentArtist) {

      Artist artiste = Artist.fromMap(currentArtist);

      artistList.add(artiste);
    });*/
  }
//method for retrieve list of artists
//methode pour recuperer tous les tracklist


 static Future<List<Tracklist>> selectAllTracklistArtistId(
      int artistID) async {
    Tracklist tracklist;
    List<Tracklist> listTracklist = [];
    var client = await database;
    List<Map> resultats = await client
        .rawQuery('SELECT * FROM tracklist WHERE artistID = ${artistID};');
    print('---------select-tracklist-----------');
    for (var tup in resultats) {
      tracklist = Tracklist.fromMap(tup);
      listTracklist.add(tracklist);
    }
    return listTracklist;
  }

  static Future<bool> findByNameArtist(String name) async {
    var client = await database;
    if (name != 'null') {
      print('---------not null- ${name}-----------');
      try {
        List<Map> resultat = await client
            .rawQuery('SELECT * FROM artist WHERE name LIKE ?', ['%${name}%']);
        print('ttttttt');
        if (resultat.isNotEmpty) {
          print('---------notEmpty- ${resultat.first['name']}-----------');
          return true;
        } else {
          print('---------Empty------------');
          return false;
        }
      } catch (e) {
        print(' ------------exeption  ${e}');
        return false;
      }
    }
    return false;
  }




/*static Future<List<Map>> rechercheArtist() async {
        var client = await database;
        List<Map> resultat = await client.rawQuery("SELECT * FROM artiste ");
        return resultat;
      */

  /*static Future<List<Map>> selectArtist(String name) async {
        var client = await database;
        List<Map> resultat = await client.rawQuery("SELECT * FROM artiste where");
        return resultat;
      }*/
}


