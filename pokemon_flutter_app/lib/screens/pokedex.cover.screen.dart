import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/shared/shared.data.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:provider/provider.dart';

import 'menu.screen.dart';

class PokedexCoverScreen extends StatefulWidget {
  @override
  _PokedexCoverScreenState createState() => _PokedexCoverScreenState();
}

class _PokedexCoverScreenState extends State<PokedexCoverScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    setSquareRotationAnimation();
    setMoveAnimation();
    setMoveSquareAnimation();
    initializeUserIfNotExists();
  }

  initializeUserIfNotExists() {
    String userName = Provider.of<SharedData>(context, listen: false).userName;
    if(userName == null){
      Provider.of<SharedData>(context, listen: false).createUserName();
    }
  }

  void setMoveSquareAnimation() {
    moveSquareAnimationController = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this, value: 0.0);
    moveSquareAnimation =
        Tween<double>(begin: 0, end: 60).animate(moveSquareAnimationController)
          ..addListener(() {
            if (moveSquareAnimation.isDismissed) {
              moveAnimationController.reverse();
            }
            setState(() {});
          });
  }

  void setMoveAnimation() {
    moveAnimationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this, value: 0.0);
    moveAnimation =
        Tween<double>(begin: 0, end: 200).animate(moveAnimationController)
          ..addListener(() {
            if (moveAnimation.isDismissed) {
              rotateSquareAnimationController.reverse();
            }
            if (moveAnimation.isCompleted) {
              moveSquareAnimationController.forward();
            }
            setState(() {});
          });
  }

  void setSquareRotationAnimation() {
    rotateSquareAnimationController = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this, value: 0.0);
    rotateSquareAnimation = Tween<double>(begin: 0.0, end: 0.8)
        .animate(rotateSquareAnimationController)
          ..addListener(() {
            if (rotateSquareAnimation.isCompleted) {
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
                offset: Offset(0, -moveAnimation.value),
                child: Container(
                  height: screenHeight / 2,
                  width: screenWidth,
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight / 2 - 120,
                      ),
                      PokedexTitle(),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, moveAnimation.value),
                child: Container(
                  height: screenHeight / 2,
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
                  onTap: () {
                    !rotateSquareAnimation.isCompleted
                        ? rotateSquareAnimationController.forward()
                        : moveSquareAnimationController.reverse();
                  },
                  child: Center(
                      child: Transform.translate(
                    offset: Offset(0, moveSquareAnimation.value),
                    child: Transform.rotate(
                      angle: rotateSquareAnimation.value,
                      child: Container(
                        child: Center(),
                        height: 120,
                        width: 120,
//                    color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
