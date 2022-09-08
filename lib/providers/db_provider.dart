
import 'dart:io';

import 'package:album_checker/models/player_model.dart';
import 'package:album_checker/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;

class DBProvider extends ChangeNotifier{

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  DBProvider();



  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "AlbumCheckerDB.db");
    print(path);

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "AlbumCheckerDB.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    var bomDataTable = await openDatabase(path, readOnly: false);

    _database = bomDataTable;

    notifyListeners();

    return bomDataTable;
  }







 //SEARCH FOR DATABASE IN THE DEVICE AND CREATE IT IF IT DOESN'T EXIST
  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await initializeDatabase();
    notifyListeners();
    return _database;
  }

  /*

  //INITIALIZE THE DATABASE
  Future<Database> initDB() async{

    //path where the database will be stored
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'AlbumCheckerDB.db');
    print(path);

    //Create the database
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db){},
        onCreate: (Database db, int version) async {
          await db.execute('''
          CREATE TABLE Teams (
          id INTEGER PRIMARY KEY,
          team_name TEXT,
          team_logo TEXT
          )
        ''');
          await db.execute('''
          CREATE TABLE Players (
          id INTEGER PRIMARY KEY,
          player_position INTEGER,
          player_name TEXT,
          player_checked BOOLEAN,
          team_id INTEGER,
          FOREIGN KEY (team_id) REFERENCES Teams (id)
          )
        ''');
        }
    );
   }*/





  //Get All TEAMS
  Future<List<TeamModel>> getAllTeams () async {
    try{
      final db = await _database;
      final response = await db?.query('Teams');
      notifyListeners();
      return response!.map((scan) => TeamModel.fromJson(scan)).toList();
    }catch(e){
      notifyListeners();
      return [];
    }



  }

  //Get Players by team  id
  Future<List<PlayerModel>>getPlayersById ( int index ) async {
    try{
      final db = await database;
      final response = await db?.query('Players', where: 'team_id = ?', whereArgs: [index]);
      notifyListeners();
      return response!.map((scan) => PlayerModel.fromJson(scan)).toList();
    }catch(e){
      print(e);
      return [];
    }

  }

  //Update a player data
  Future<int> updatePlayer (PlayerModel playerModel) async {
    try {
      final db = await _database;
      final response = await db!.update(
          'Players', playerModel.toJson(), where: 'id = ?',
          whereArgs: [playerModel.id]);
      notifyListeners();
      return response;
    }catch(e){
      print(e);
      notifyListeners();
      return 0;
    }
  }





}