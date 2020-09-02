
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class TypewriterText extends StatelessWidget {
  final String text;
  final repeat;
  TypewriterText(this.text, {this.repeat});

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: 200),
      text: [
        text,
      ],
      textStyle: kDefaultTextStyle.copyWith(fontSize: 18),
    );
  }
}
