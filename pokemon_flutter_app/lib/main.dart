import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/screens/cover.screen.dart';
import 'package:pokemon_flutter_app/screens/menu.screen.dart';

import 'components/components.dart';

//TODO: change icon
//TODO: (optional) make so that the open menu animation reverses any time you tap the square
//TODO: change orientation to portrait

main(){
  runApp(MaterialApp(
    home: PokedexCoverScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red
    ),
  ));
}


