import 'package:flutter/material.dart';
import 'package:musicaudioplayer/src/Screens/Home.dart';

import 'package:musicaudioplayer/src/providers/RechercheProvider.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RechercheProvider(), child: Home());
  }
}
