import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class MenuButton extends StatelessWidget {
  String text = '';
  Function onTap;

  MenuButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        margin: EdgeInsets.only(top: 16, bottom: 4),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/buttonBackground.png'),
            )),
        child: Center(
          child: Text(
            text,
            style: kDefaultTextStyle,
          ),
        ),
      ),
    );
  }
}
