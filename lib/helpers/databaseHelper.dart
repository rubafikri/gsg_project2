import 'dart:io';

import 'package:flutter_gsg_project2/models/herb.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();

  static final String dbName = '/herb.db';
  static final String herbTableName = 'Herb';
  static final String herbidColumnName = 'id';
  static final String herbnameColumnName = 'name';
  static final String ingrediantsColumnName = 'ingrediants';
  static final String prepationColumnName = 'prepation';
  static final String shortDiscriptionColumnName = 'shortDiscription';
  static final String isFavColumnName = 'isFav';

  Database datadbse;
  initDatabase() async {
    datadbse = await getDatabaseConnection();
    print('hi');
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + dbName;
    Database database =
        await openDatabase(path, version: 1, onOpen: (datadbse) {
      print('the opend');
    }, onCreate: (db, v) {
      print('created');
      db.execute('''CREATE TABLE $herbTableName (
            $herbidColumnName INTEGER PRIMARY KEY AUTOINCREMENT, 
            $herbnameColumnName TEXT, 
            $ingrediantsColumnName TEXT, 
            $shortDiscriptionColumnName TEXT, 
            $prepationColumnName TEXT, 
            $isFavColumnName INTEGER  
          )''');
    });

    return database;
  }

  insertNewTask(Herb herb) async {
    Map map = {
      'name': herb.name,
      'ingrediants': herb.ingrediants,
      'prepation': herb.prepation,
      'shortDiscription': herb.shortDiscription,
      'isFav': herb.isFav ? 1 : 0,
      'id': herb.id,
    };

    int rowNum = await datadbse.insert(herbTableName, {...herb.toMap()});

    print(rowNum);
  }

  insertHerb(Herb herb) async {
    int rowNum = await datadbse.insert(herbTableName, herb.toMap());
    print(rowNum);
  }

  Future<List<Herb>> getAllHerb() async {
    List<Map<String, Object>> results = await datadbse.query(herbTableName);
    List<Herb> herbs = results.map((e) {
      return Herb.fromMap(e);
    }).toList();
    return herbs;
  }

  Future<Herb> getSpecificHerb(int id) async {
    List<Map<String, dynamic>> results =
        await datadbse.query(herbTableName, where: 'id=?', whereArgs: [id]);
    Herb taskModel = Herb.fromMap(results.first);
    return taskModel;
  }

  deleteTask(int id) async {
    datadbse.delete(herbTableName, where: 'id=?', whereArgs: [id]);
  }

  updateTask(Herb taskModel) async {
    datadbse.update(herbTableName, {...taskModel.toMap()},
        where: 'id=?', whereArgs: [taskModel.id]);
  }

  // updateHerb(Herb herb) async {
  //   herb.isFav = !herb.isFav;
  //   int UpdateTask = await datadbse.update(herbTableName, herb.toMap(),
  //       where: 'id=?', whereArgs: [herb.id]);
  //   print(UpdateTask);
  // }

  getTablesNames() async {
    List<Map<String, Object>> tables = await datadbse
        .query('sqlite_master', where: 'type=?', whereArgs: ['table']);
    List<String> tablesNames = tables.map((e) => e['name'].toString()).toList();
    print(tablesNames);
  }
}
