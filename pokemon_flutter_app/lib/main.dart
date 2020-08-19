import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/screens/home.screen.dart';
import 'package:pokemon_flutter_app/screens/menu.screen.dart';

import 'components/components.dart';

//TODO: change icon

main(){
  runApp(MaterialApp(
    home: PokedexHomeScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.red
    ),
  ));
}


