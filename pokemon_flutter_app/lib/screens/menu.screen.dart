import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/widgets/menu.button.dart';
import 'package:audioplayers/audio_cache.dart';

class MenuScreen extends StatelessWidget {
//TODO: remove unused assets in the assets folder
//TODO: mover todos os projetos do flutter para a outra memória(a de 120 gb) em geral mover tudo pra la, porque quando voce arruinar esse SO ficará tudo salvo lá
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
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 16,
              ),
              child: Text(
                'Welcome',
                style: kDefaultTextStyle,
              ),
            ),
            MenuButton(
              text: 'Your Profile',
              onTap: () {
                final player = AudioCache();
                player.play('buttonSelected.wav');
                print('button pressed');
              },
            ),
            MenuButton(
              text: 'Search Pokemon',
              onTap: () {
                final player = AudioCache();
                player.play('buttonSelected.wav');
                print('button pressed');
              },
            ),
            MenuButton(
              text: 'Forum',
              onTap: () {
                final player = AudioCache();
                player.play('buttonSelected.wav');
                print('button pressed');
              },
            ),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
