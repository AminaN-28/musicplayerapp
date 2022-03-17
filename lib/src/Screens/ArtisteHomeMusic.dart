

import 'package:flutter/material.dart';
import 'package:musicaudioplayer/src/Models/artist.dart';
import 'package:musicaudioplayer/src/widgets/ArtistWidget.dart';
import 'package:musicaudioplayer/src/widgets/OneMusic.dart';

import 'dart:convert';

import 'package:provider/provider.dart';

class ArtisteHomeMusic extends StatefulWidget {
  Artist artist;
  ArtisteHomeMusic(this.artist);
  @override
  _HomeMusicState createState() => _HomeMusicState();
}

class _HomeMusicState extends State<ArtisteHomeMusic> {
  

 /* @override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Center(
              child: 
              Column(children: [
              ArtistWidget(widget.artist.name, widget.artist.urlimage),
              Expanded(
                  child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemCount:  widget.artist.artistTracklist.length,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 75,
                            child: Center(
                              child: OneMusic(widget.artist.artistTracklist[position]),
                            ),
                          ),
                        );
                      
                      })
                      )
            ])));
           
    
  }
}
