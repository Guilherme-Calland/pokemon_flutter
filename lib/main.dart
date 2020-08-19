import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: PokemonFlutter(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class PokemonFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Pokemon App')
      ),
    );
  }
}
