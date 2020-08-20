
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class TypewriterText extends StatelessWidget {
  String text;
  TypewriterText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48),
      child: TypewriterAnimatedTextKit(
        isRepeatingAnimation: false,
        speed: Duration(milliseconds: 200),
        text: [
          text,
        ],
        textStyle: kDefaultTextStyle,
      ),
    );
  }
}
