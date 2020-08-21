import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/shared/shared.data.dart';
import 'package:pokemon_flutter_app/widgets/menu.button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
//TODO: remove unused assets in the assets folder
//TODO: mover todos os projetos do flutter para a outra memória(a de 120 gb) em geral mover tudo pra la, porque quando voce arruinar esse SO ficará tudo salvo lá
//TODO: feature: search for any pokemon and show stats
//TODO: feature: the picture that shows up of the pokemon must be from a other little screen that slides down so that it justifies it being coloured
//TODO: feature: go out into the world and reach a random pokemon(there are a total od 1054 as shown here: https://pokeapi.co/api/v2/pokemon), create an algorithm that tells you your chances of capturing it

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    bottom: 16,
                  ),
                  child: Consumer<SharedData>(
                    builder: (context, data, child){
                      return Text(
                        'Welcome ${data.userName}',
                        style: kDefaultTextStyle.copyWith(),
                      );
                    }
                  ),
                ),
                MenuButton(
                  text: 'Your Profile',
                  onTap: () {
                    final player = AudioCache();
                    player.play('buttonSelected.wav');
                    Navigator.pushNamed(context, 'your.profile.screen');
                  },
                ),
                MenuButton(
                  text: 'Search Pokemon',
                  onTap: () {
                    final player = AudioCache();
                    player.play('buttonSelected.wav');
                  },
                ),
                MenuButton(
                  text: 'Forum',
                  onTap: () {
                    final player = AudioCache();
                    player.play('buttonSelected.wav');
                  },
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),

      ],
    );
  }

}
