import 'package:flutter/material.dart';

class PokedexTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0.0, right: 4),
          child: Icon(
            Icons.menu,
            size: 30,
            color: Color(0xffb30000),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Text('POKEDEX', style: TextStyle(
              fontWeight: FontWeight.w900, color: Color(0xffb30000), fontSize: 40
          ),),
        ),
      ],
    );
  }
}
