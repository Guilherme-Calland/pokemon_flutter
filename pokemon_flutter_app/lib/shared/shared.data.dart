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
    notifyListeners();
  }

  createPokemon() async {
    Map<String,dynamic> data = {
      'name' : ''
    };
    int id = await database.createPokemon(data);
    print('pokemon of id $id created');
    //TODO:this could be better I think
    String newPokemonSlot = '';
    pokemonList.add(ListText(id, newPokemonSlot));
    readPokemonList();
  }

  readPokemonList() async{
    List<Map<String, dynamic>> data = await database.readPokemonList();
    List<ListText> pokemonListTemp = List<ListText>();
    for(Map<String, dynamic> m in data){
      String pokemonName = m['name'];
      int pokemonId = m['id'];
      pokemonListTemp.add(ListText(pokemonId, pokemonName));
    }
    pokemonList = pokemonListTemp;
    for(ListText l in pokemonList){
      print(l.text);
    }
    notifyListeners();
  }

  updatePokemonList(int id, String value) async{
    Map<String, dynamic> data = {
      'id' : id,
      'name' : value
    };
    int result = await database.updatePokemonList(data);
    print('updating list $result');
  }

  deletePokemon(int id) async {
    int result = await database.deletePokemon(id);
    print('deleted pokemon: $result');
    readPokemonList();
  }

}

