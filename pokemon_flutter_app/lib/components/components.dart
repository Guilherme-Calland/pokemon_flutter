import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/shared/shared.data.dart';
import 'package:provider/provider.dart';

TextStyle kDefaultTextStyle = TextStyle(fontSize: 20, color: Color(0x8021ff00), fontFamily: 'PressStart2P');

AnimationController rotateSquareAnimationController, moveAnimationController, moveSquareAnimationController;
Animation rotateSquareAnimation, moveAnimation, moveSquareAnimation;

Color kBackgroundColor = Color(0xff282828);

SharedData provider(BuildContext context) => Provider.of<SharedData>(context, listen: false);
SharedData listenerProvider(BuildContext context) => Provider.of<SharedData>(context, listen: true);

MaterialColor kBackgroundMaterialColor = MaterialColor(0xff282828, {
  50: Color(0xff282828),
  100: Color(0xff282828),
  200: Color(0xff282828),
  300: Color(0xff282828),
  400: Color(0xff282828),
  500: Color(0xff282828),
  600: Color(0xff282828),
  700: Color(0xff282828),
  800: Color(0xff282828),
  900: Color(0xff282828),
});