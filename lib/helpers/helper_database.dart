import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutterdatabase/models/mpanitia.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {


    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'panitia.db';


    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);


    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE panitia (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        jurusan TEXT,
        fakultas TEXT,
        panitia TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('panitia', orderBy: 'name');
    return mapList;
  }

//insert data ke dalam database
  Future<int> insert(Panitia object) async {
    Database db = await this.database;
    int count = await db.insert('panitia', object.toMap());
    return count;
  }
//update database
  Future<int> update(Panitia object) async {
    Database db = await this.database;
    int count = await db.update('panitia', object.toMap(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

//delete database
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('panitia',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<List<Panitia>> getPanitiaList() async {
    var panitiaMapList = await select();
    int count = panitiaMapList.length;
    List<Panitia> panitiaList = List<Panitia>();
    for (int i=0; i<count; i++) {
      panitiaList.add(Panitia.fromMap(panitiaMapList[i]));
    }
    return panitiaList;
  }

}