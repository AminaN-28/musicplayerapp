import 'package:audioplayer/audioplayer.dart';

import 'package:flutter/material.dart';
import 'package:musicaudioplayer/src/Models/Tracklist.dart';
import 'package:musicaudioplayer/src/providers/MusicProvider.dart';
import 'package:provider/provider.dart';

class OneMusic extends StatefulWidget {
  final Tracklist tracklist;

  OneMusic(this.tracklist);

  @override
  _OneMusicState createState() => _OneMusicState();
}

class _OneMusicState extends State<OneMusic> with AutomaticKeepAliveClientMixin {
  final AudioPlayer audioPlugin = AudioPlayer();

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    print("we are rebuilding");
    return ChangeNotifierProvider(
      create: (context) => MusicProvier(),
      child: ListTile(
        title: Text(
          widget.tracklist.title,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.tracklist.imageMusic,
            height: 300,
            fit: BoxFit.fitHeight,
          ),
        ),
        trailing: Container(
          width: 100,
          child: Consumer<MusicProvier>(
            builder: (context, artist, _) {
              return IconButton(
                color: Colors.white,
                icon:artist.icon,
                onPressed: () {
                  artist.playSound(widget.tracklist.preview);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
