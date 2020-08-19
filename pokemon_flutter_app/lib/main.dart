import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    home: Pokedex(),
    debugShowCheckedModeBanner: false,
  ));
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pokedex'),
      ),
    );
  }
}
