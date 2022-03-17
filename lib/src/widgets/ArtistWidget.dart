import 'package:flutter/material.dart';

class ArtistWidget extends StatelessWidget {
  final String artistName;
  final String imageArtiste;
  ArtistWidget(this.artistName, this.imageArtiste);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30.0),
      child: Column(
        children: [
          Hero(
            tag: artistName,
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageArtiste),
              radius: 100,


            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Text(artistName,style: TextStyle(color:Colors.white,fontSize: 30,fontStyle: FontStyle.italic),),
          ),
        ],
      ),  
    );
  }
}
