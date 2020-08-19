import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    home: Pokedex(),
    debugShowCheckedModeBanner: false,
  ));
}

class Pokedex extends StatefulWidget {
  @override
  _PokedexState createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight/2,
                width: screenWidth,
                color: Colors.red,
              ),
              Container(
                height: screenHeight/2,
                width: screenWidth,
                color: Colors.white,
              )
            ],
          ),
          Stack(
            children: [
              Center(
                child: Container(
                  height: 50,
                  width: screenWidth,
                  color: Colors.black,
                ),
              ),
              Center(
                child: Transform.rotate(
                  angle: 0.8,
                  child: Container(
                    height: 120,
                    width: 120,
//                    color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 30
                      )
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
