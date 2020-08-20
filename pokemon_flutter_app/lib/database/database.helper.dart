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
    final file = join(path, 'pokedex_database.db');
    final db = await openDatabase(file, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{
    String sqlUserCreation = 'CREATE TABLE user('
        'id INTEGER PRIMARY KEY AUTOINCREMENT'
        'name VARCHAR'
        ')';
    String sqlPokemonListCreation = 'CREATE TABLE pokemon('
        'id INTEGER PRIMARY KEY AUTOINCREMENT'
        'name VARCHAR'
        ')';
    await db.execute(sqlUserCreation);
    await db.execute(sqlPokemonListCreation);
  }



}