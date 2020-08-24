import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/components/components.dart';
import 'package:pokemon_flutter_app/shared/shared.data.dart';
import 'package:pokemon_flutter_app/widgets/list.text.dart';
import 'package:pokemon_flutter_app/widgets/menu.button.dart';
import 'package:pokemon_flutter_app/widgets/pokedex.title.dart';
import 'package:pokemon_flutter_app/widgets/profile.button.dart';
import 'package:pokemon_flutter_app/widgets/typewriter.text.dart';
import 'package:provider/provider.dart';

class YourProfileScreen extends StatelessWidget {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = provider(context).userName;
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
          padding: EdgeInsets.only(left: 16, top:48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Name:', style: kDefaultTextStyle,),
                  Expanded(
                    child: TextField(
                      onChanged: (value){
                        provider(context).updateUserName(value);
                      },
                      controller: nameController,
                      style: kDefaultTextStyle,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,),
              TypewriterText('Your Pokemon:'),
              SizedBox(height: 16,),
//              Consumer<SharedData>(
//                builder: (context, data, child){
//                  List<ListText> pokemonList = data.pokemonList;
//                  return Column(
//                      children: pokemonList
//                  );
//                }
//              ),
            Column(
              children: listenerProvider(context).pokemonList
            ),
              ProfileButton(text: 'Add', onTap: (){
                provider(context).createPokemon();
              })
            ],
          ),
        ),
      ),
    );
  }
}


