import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key key,
  }) : super(key: key);

//TODO: remove unused assets in the assets folder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: add the player's name here
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16),
              child: Text('Welcome', style: kDefaultTextStyle),
            ),
            MenuButton(
              text: 'Your Profile',
            ),
            MenuButton(text: 'Search Pokemon'),
            MenuButton(text: 'Forum'),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}

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
