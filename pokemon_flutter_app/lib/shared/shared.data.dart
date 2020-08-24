import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/database/database.helper.dart';
import 'package:pokemon_flutter_app/widgets/list.text.dart';

class SharedData extends ChangeNotifier{
  String userName = null;
  DatabaseHelper database = DatabaseHelper();

  List<ListText> pokemonList = List<ListText>();

  createUserName() async{
    Map<String, dynamic> data = {
      'name' : ''
    };
    int result = await database.createUserName(data);
    print('created user of id: $result');
    readUserName();
  }

  readUserName() async{
    List< Map< String, dynamic> > data = await database.readUserName();
    String dataUserName = (data.first)['name'];
    userName = dataUserName;
    notifyListeners();
  }

  updateUserName(String userName) async{
    Map<String, dynamic> data = {
      'name' : userName
    };
    int result = await database.updateUserName(data);
    print('updated name: $result');
    readUserName();
  }

  createPokemon() async {
    Map<String,dynamic> data = {
      'name' : ''
    };
    int result = await database.createPokemon(data);
    print('pokemon of id $result created');
    String newPokemonSlot = ' ';
    pokemonList.add(ListText(newPokemonSlot));
    readPokemonList();
  }

  readPokemonList() async{
    List<Map<String, dynamic>> data = await database.readPokemonList();
    List<ListText> pokemonListTemp = List<ListText>();
    for(Map<String, dynamic> m in data){
      String pokemonName = m['name'];
      pokemonListTemp.add(ListText(pokemonName));
    }
    pokemonList = pokemonListTemp;
    notifyListeners();
  }


}

