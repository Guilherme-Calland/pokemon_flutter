import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class ProfileButton extends StatelessWidget {
  String text = '';
  Function onTap;

  ProfileButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 40,
        margin: EdgeInsets.only(top: 16, left:4),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profileButtonBackground.png'),
            )),
        child: Center(
          child: Text(
            text,
            style: kDefaultTextStyle.copyWith(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
