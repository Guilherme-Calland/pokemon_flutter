import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: Text('Pokedex', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)
        )
    );
  }
}
