import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/widgets/list.text.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:pokemon_flutter_app/widgets/profile.button.dart';
import 'package:pokemon_flutter_app/widgets/typewriter.text.dart';

class YourProfileScreen extends StatelessWidget {
  final String userName;
  final nameController = TextEditingController();

  YourProfileScreen({this.userName}) {
    //TODO: solve this delete problem
    nameController.text = userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 48),
          child: PokedexTitle(),
        ),
        //setting leading as an empty container to remove the return arrow
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Name:',
                    style: kDefaultTextStyle,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        provider(context).updateUserName(value);
                      },
                      controller: nameController,
                      style: kDefaultTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              TypewriterText('My Pokemon:'),
              SizedBox(
                height: 20,
              ),
              Column(children: listenerProvider(context).pokemonList),
              ProfileButton(
                text: 'Add',
                onTap: () {
                  provider(context).createPokemon();
                },
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                'Accomplishments:',
                style: kDefaultTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(height: 4,),
              Column(children: listenerProvider(context).accomplishmentList,),
              ProfileButton(
                text: 'Add',
                onTap: () {
                  provider(context).createAccomplishment();
                },
              ),
              SizedBox(height: 20,),
              ProfileButton(
                text: 'Back',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
