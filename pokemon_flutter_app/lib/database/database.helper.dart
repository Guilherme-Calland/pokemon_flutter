import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();
  factory DatabaseHelper(){
    return _databaseHelper;
  }
  DatabaseHelper._internal(){}
  Database _database;

  get database async{
    if(_database != null){
      return _database;
    } else {
      _database = await initializeDatabase();
      return _database;
    }
  }

  initializeDatabase() async{
    final path = await getDatabasesPath();
    final file = join(path, 'pokedexdatabase.db');
    final db = await openDatabase(file, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{
    String sqlUser = 'CREATE TABLE user('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name VARCHAR'
        ')';
    String sqlAccomplishments = 'CREATE TABLE accomplishments('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'title VARCHAR'
        ')';
    String sqlPokemonList= 'CREATE TABLE pokemon('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name VARCHAR'
        ')';
    await db.execute(sqlUser);
    await db.execute(sqlAccomplishments);
    await db.execute(sqlPokemonList);

    Map<String, dynamic> userName = {
      'name' : ''
    };
    db.insert('user', userName);
  }


  //CRUD username

  createUserName(Map<String, dynamic> data) async{
    var db = await database;
    int result = await db.insert('user', data);
    return result;
  }

  readUserName() async{
    var db = await database;
    String sql = 'SELECT * FROM user';
    List< Map<String, dynamic> > data = await db.rawQuery( sql );
    print(data);
    return data;
  }

  updateUserName(Map<String, dynamic> data) async{
    var db = await database;
    int result = await db.update(
      'user',
      data,
      where: 'id = ?',
      whereArgs: [1]
    );
    return result;
  }

  //CRUD pokemon of the user's pokemon list

  createPokemon(Map<String, dynamic> data) async{
    var db = await database;
    int result = await db.insert('pokemon', data);
    return result;
  }

  readPokemonList() async{
    var db = await database;
    String sql = 'SELECT * FROM pokemon';
    List<Map<String, dynamic>> data = await db.rawQuery( sql );
    return data;
  }

  updatePokemonList(Map<String, dynamic> data) async{
    var db = await database;
    int result = await db.update(
      'pokemon',
      data,
      where: 'id = ?',
      whereArgs: [data['id']]
    );
    return result;
  }

  deletePokemon(int id) async{
    var db = await database;
    int result = await db.delete(
      'pokemon',
      where : 'id = ?',
      whereArgs: [id]
    );
    return result;
  }

  //CRUD of user's accomplishments

  createAccomplishment(Map<String, dynamic> data) async{
    var db = await database;
    int result = await db.insert('accomplishments', data);
    return result;
  }

  readAccomplishmentList() async{
    var db = await database;
    String sql = 'SELECT * FROM accomplishments';
    List<Map<String, dynamic>> data = await db.rawQuery( sql );
    return data;
  }

  updateAccomplishmentList(Map<String, dynamic> data) async{
    var db = await database;
    int result = await db.update(
        'accomplishments',
        data,
        where: 'id = ?',
        whereArgs: [data['id']]
    );
    return result;
  }

  deleteAccomplishment(int id) async{
    var db = await database;
    int result = await db.delete(
        'accomplishments',
        where : 'id = ?',
        whereArgs: [id]
    );
    return result;
  }

}