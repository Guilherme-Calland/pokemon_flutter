import 'package:flutter/material.dart';
import 'package:pokemon_flutter_app/database/database.helper.dart';

class SharedData extends ChangeNotifier{
  String userName = null;
  DatabaseHelper database = DatabaseHelper();

  changeUserName(String value){
    userName = value;
    notifyListeners();
  }

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
}

