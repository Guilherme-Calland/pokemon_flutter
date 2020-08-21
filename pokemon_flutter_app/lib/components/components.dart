import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/shared/shared.data.dart';
import 'package:provider/provider.dart';

TextStyle kDefaultTextStyle = TextStyle(fontSize: 20, color: Color(0x8021ff00), fontFamily: 'PressStart2P');

AnimationController rotateSquareAnimationController, moveAnimationController, moveSquareAnimationController;
Animation rotateSquareAnimation, moveAnimation, moveSquareAnimation;

Color kBackgroundColor = Color(0xff282828);

SharedData provider(BuildContext context) => Provider.of<SharedData>(context, listen: false);

