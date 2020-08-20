import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pokemon_flutter_app/widgets/typewriter.text.dart';

class YourProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: PokedexTitle(),
        //setting leading as an empty container to remove the return arrow
        leading: Container(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top:48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TypewriterText('Name:Guilherme'),
            SizedBox(height: 32,),
            Text('Your Pokemon:', style: kDefaultTextStyle,),
            Row(
              children: [
                SizedBox(width: 100,),
                Column(
                  children: [
                    ListText('Blastoise'),
                    ListText('Blastoise'),
                    ListText('Blastoise'),
                    ListText('Blastoise'),
                    ListText('Blastoise'),
                    ListText('Blastoise'),
                    ListText('Blastoise'),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

class ListText extends StatelessWidget {
  String text;
  ListText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(text, style: kDefaultTextStyle,),
    );
  }
}

