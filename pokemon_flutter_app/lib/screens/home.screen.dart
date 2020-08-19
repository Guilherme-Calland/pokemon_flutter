import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

import 'menu.screen.dart';

class PokedexHomeScreen extends StatefulWidget {
  @override
  _PokedexHomeScreenState createState() => _PokedexHomeScreenState();
}

class _PokedexHomeScreenState extends State<PokedexHomeScreen> with TickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    setRotationAnimation();
    setMoveAnimation();
  }

  void setMoveAnimation() {
    moveAnimationController = AnimationController(
        duration: Duration(milliseconds: 1000),
        vsync: this,
        value: 0.0
    );
    moveAnimation = Tween<double>(begin:0, end: 200).animate(moveAnimationController)..addListener(() {
      if(moveAnimation.isDismissed){
        rotateAnimationController.reverse();
      }
      setState(() {});
    });
  }

  void setRotationAnimation() {
    rotateAnimationController = AnimationController(
        duration: Duration(milliseconds: 500),
        vsync: this,
        value: 0.0
    );
    rotateAnimation = Tween<double>(begin:0.0, end: 0.8).animate(rotateAnimationController)..addListener(() {
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
          MenuScreen(),
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
          Transform.translate(
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
                    !rotateAnimation.isCompleted ? rotateAnimationController.forward() : moveAnimationController.reverse();
                  },
                  child: Center(
                      child: Transform.rotate(
                        angle: rotateAnimation.value,
                        child: Container(
                          child: Center(
//                          child: Text('push', style: TextStyle(color: Colors.black26),)
                          ),
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
          )
        ],
      ),
    );
  }
}
