import 'package:flutter/material.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:musicaudioplayer/src/OnGeneratedRoute.dart';
import 'package:musicaudioplayer/src/providers/RechercheProvider.dart';
import 'package:provider/provider.dart';

class ListViewArtist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerArtist = Provider.of<RechercheProvider>(context, listen: false);
    return GridView.builder(
        itemCount: providerArtist.allArtiste.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, int position) {
          return GestureDetector(
            onTap: () {
              //apres avoir supprimer le materialpageroute
              //on declare une variable de type artist et on donne en argument dans pushNamed
              Artist artist = providerArtist.allArtiste[position];
              Navigator.pushNamed(context, GenerateRoute.artisteHomeMusic
              ,arguments: artist);
              //);
            },
            child: Hero(
                tag: providerArtist.allArtiste[position].name,
                child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        providerArtist.allArtiste[position].urlimage),
                    radius: 80,
                  ),
                  //positioned juste pour positionner les elements
                  //Align nous permet d'aligner les widgets
                  //
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Youssou",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          );
        });
  }
}
