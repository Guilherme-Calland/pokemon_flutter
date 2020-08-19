import 'package:flutter/material.dart';

import 'components/components.dart';

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

class _PokedexState extends State<Pokedex> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    setRotationAnimation();
    moveAnimationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this,
        value: 0.0
    );
    moveAnimation = Tween<double>(begin:0, end: 300).animate(moveAnimationController)..addListener(() {
      setState(() {});
    });
  }

  void setRotationAnimation() {
    rotateAnimationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
        value: 0.0
    );
    rotateAnimation = Tween<double>(begin:0.8, end: 0.0).animate(rotateAnimationController)..addListener(() {
      if(rotateAnimation.isCompleted){
        moveAnimationController.forward();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.grey,
            body: Center(
              child: Text('POKEDEX', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)
            )
          ),
          Column(
            children: [
              Transform.translate(
                offset: Offset(0,- moveAnimation.value),
                child: Container(
                  height: screenHeight/2,
                  width: screenWidth,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(0, moveAnimation.value),
                child: Container(
                  height: screenHeight/2,
                  width: screenWidth,
                  color: Colors.white,
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              rotateAnimationController.forward();
            },
            child: Transform.translate(
              offset: Offset(0, moveAnimation.value),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width: screenWidth,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      rotateAnimationController.forward();
                    },
                    child: Center(
                      child: Transform.rotate(
                        angle: rotateAnimation.value,
                        child: Container(
                          height: 120,
                          width: 120,
//                    color: Colors.white,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 30,
                            )
                          ),
                        ),
                      )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
