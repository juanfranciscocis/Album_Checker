
import 'dart:io';

import 'package:album_checker/models/team_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider extends ChangeNotifier{

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  DBProvider();

  //SEARCH FOR DATABASE IN THE DEVICE AND CREATE IT IF IT DOESN'T EXIST
  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await initDB();
    return _database;
  }

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
          player_name TEXT,
          player_checked BOOLEAN,
          team_id INTEGER,
          FOREIGN KEY (team_id) REFERENCES Teams (id)
          )
        ''');
        }
    );

  }


  //Get All TEAMS
  Future<List<TeamModel>> getAllTeams () async {
    final db = await database;
    final response = await db?.query('Teams');
    return response!.map((scan) => TeamModel.fromJson(scan)).toList();
  }





}