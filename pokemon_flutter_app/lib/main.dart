import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/screens/pokedex.cover.screen.dart';
import 'package:pokemon_flutter_app/screens/menu.screen.dart';
import 'package:pokemon_flutter_app/screens/your.profile.screen.dart';

import 'components/components.dart';

//TODO: change icon
//TODO: (optional) make so that the open menu animation reverses any time you tap the square
//TODO: change orientation to portrait

main(){
  runApp(MaterialApp(
    home: PokedexCoverScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red,
      accentColor: Color(0xff282828),
      cursorColor: Color(0xff282828)
    ),
    initialRoute: 'pokedex.cover.screen',
    routes: {
      'pokedex.cover.screen' : (context) => PokedexCoverScreen(),
      'menu.screen' : (context) => MenuScreen(),
      'your.profile.screen' : (context) => YourProfileScreen(),
    }
  ));
}


