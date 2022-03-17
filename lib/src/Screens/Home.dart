import 'package:flutter/material.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:musicaudioplayer/src/providers/ArtisteProvider.dart';
import 'package:musicaudioplayer/src/providers/RechercheProvider.dart';
import 'package:musicaudioplayer/src/utils/DatabaseHelper.dart';
import 'package:musicaudioplayer/src/utils/Networking.dart';
import 'package:musicaudioplayer/src/widgets/ListArtistArtist.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {

  String artistName = "null";
  int isVide;
  List<Artist> listArtist;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHelper databaseHelper;
 

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseHelper.get_All_Artits().then(
      (list){
        if (list.isEmpty){}
        else
        {
           for (var art in list) 
           {
              print('------${art.name}');
              print('------${art.artistID}');
              print('------${art.urlimage}');
              widget.listArtist = list;
            }

        }
      }
    
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white10,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<RechercheProvider>(builder: (context, rechercher, _) {
                return FutureBuilder(
                  future: Networking.getMusicBasedOnArtistName(widget.artistName),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasError) {
              return Center(child: Text("Check your Network"));
            } else if (asyncSnapshot.connectionState ==
                ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (asyncSnapshot.data != null){
                 print("------addAllArtist-------");
                  rechercher.allArtiste.clear();
                  rechercher.allArtiste.addAll(asyncSnapshot.data);
                //rechercher.allArtiste.add(asyncSnapshot.data);
              //DatabaseHelper.insertArtist(asyncSnapshot.data);
              }
              return ListViewArtist();
            }
          },
        );
      }),
    );
  }

  Future<void> _showDialog(BuildContext context) {
    TextEditingController textEditingController = new TextEditingController();
    var provider = Provider.of<RechercheProvider>(context, listen: false);
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Search Your Artist"),
            content: Container(
              height: 60,
              child: Column(
                children: [
                  TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: "Artist Name",
                          prefixIcon: Icon(Icons.person)))
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    //Artist artist =Artist(_name, _img, _nbAlbum, _tracklist)
                    widget.artistName = textEditingController.text;
                    provider.changeStatus();
                    Navigator.of(context).pop();
                  },
                  child: Text("Confirm"))
            ],
          );
        });
  }
}
// class Home extends StatelessWidget {
//   String artistName = "null";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF111111),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showDialog(context);
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Consumer<RechercheProvider>(
//         builder: (context, rechercher, _) {
//           return FutureBuilder(
//             future: Networking.getMusicBasedOnArtistName(artistName),
//             builder: (context, asyncSnapshot) {
//               if (asyncSnapshot.hasError) {
//                 return Center(child: Text("Check your Network"));
//               } else if (asyncSnapshot.connectionState ==
//                   ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else {
//                 if (asyncSnapshot.data != null) {
//                   rechercher.allArtiste.add(asyncSnapshot.data);
//                 }
//                 return ListViewArtist();
//               }
//             },
//           );
//         },
//       ),
//     );
//   }

//   Future<void> _showDialog(BuildContext context) {
//     TextEditingController textEditingController = new TextEditingController();
//     var provider = Provider.of<RechercheProvider>(context, listen: false);
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Rechercher Votre artiste"),
//             content: Container(
//               height: 60,
//               child: Column(
//                 children: [
//                   TextField(
//                       controller: textEditingController,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.blue)),
//                           hintText: "Nom de votre artiste",
//                           prefixIcon: Icon(Icons.person)))
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     artistName = textEditingController.text;
//                     provider.changeStatus();
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("Valider"))
//             ],
//           );
//         });
//   }
// }

// return FutureBuilder(
//             future: Networking.getMusicBasedOnArtistName(widget.artistName),
//             builder: (context, asyncSnapshot) {
//               if (asyncSnapshot.hasError) {
//                 return Center(child: Text("Check your Network"));
//               } else if (asyncSnapshot.connectionState ==
//                   ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else {
//                 if (asyncSnapshot.data != null) {
//                   rechercher.allArtiste.add(asyncSnapshot.data);
//                   DatabaseHelper.inserArtist(asyncSnapshot.data).then((value) {
//                     if (value > 1) {
//                       print('insertion OK');
//                     } else {
//                       print('insertion KO');
//                     }
//                   });
//                 }
//                 return ListViewArtist();
//               }
//             },
//           );