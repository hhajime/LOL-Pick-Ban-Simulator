import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

DBHelper() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'data.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE savedData(id INTEGER PRIMARY KEY, name TEXT, blueBan1 TEXT, blueBan2 TEXT, blueBan3 TEXT, blueBan4 TEXT, blueBan5 TEXT, bluePlayer1 TEXT, bluePlayer2 TEXT, bluePlayer3 TEXT, bluePlayer4 TEXT, bluePlayer5 TEXT, bluePlayer1Name TEXT, bluePlayer2Name TEXT, bluePlayer3Name TEXT, bluePlayer4Name TEXT, bluePlayer5Name TEXT, blueTeamName TEXT, redBan1 TEXT, redBan2 TEXT, redBan3 TEXT, redBan4 TEXT, redBan5 TEXT, redPlayer1 TEXT, redPlayer2 TEXT, redPlayer3 TEXT, redPlayer4 TEXT, redPlayer5 TEXT, redPlayer1Name TEXT, redPlayer2Name TEXT, redPlayer3Name TEXT, redPlayer4Name TEXT, redPlayer5Name TEXT, redTeamName TEXT)');
    },
    version: 1,
  );

  Future<void> insertData(Data data) async {
    final db = await database;
    await db.insert(
      'savedData',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Data>> savedData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('savedData');
    return List.generate(
        maps.length,
        (i) => Data(
            id: maps[i]['id'],
            name: maps[i]['name'],
            blueBan1: maps[i]['blueBan1'],
            blueBan2: maps[i]['blueBan2'],
            blueBan3: maps[i]['blueBan3'],
            blueBan4: maps[i]['blueBan4'],
            blueBan5: maps[i]['blueBan5'],
            bluePlayer1: maps[i]['bluePlayer1'],
            bluePlayer2: maps[i]['bluePlayer2'],
            bluePlayer3: maps[i]['bluePlayer3'],
            bluePlayer4: maps[i]['bluePlayer4'],
            bluePlayer5: maps[i]['bluePlayer5'],
            bluePlayer1Name: maps[i]['bluePlayer1Name'],
            bluePlayer2Name: maps[i]['bluePlayer2Name'],
            bluePlayer3Name: maps[i]['bluePlayer3Name'],
            bluePlayer4Name: maps[i]['bluePlayer4Name'],
            bluePlayer5Name: maps[i]['bluePlayer5Name'],
            blueTeamName: maps[i]['blueTeamName'],
            redBan1: maps[i]['redBan1'],
            redBan2: maps[i]['redBan2'],
            redBan3: maps[i]['redBan3'],
            redBan4: maps[i]['redBan4'],
            redBan5: maps[i]['redBan5'],
            redPlayer1: maps[i]['redPlayer1'],
            redPlayer2: maps[i]['redPlayer2'],
            redPlayer3: maps[i]['redPlayer3'],
            redPlayer4: maps[i]['redPlayer4'],
            redPlayer5: maps[i]['redPlayer5'],
            redPlayer1Name: maps[i]['redPlayer1Name'],
            redPlayer2Name: maps[i]['redPlayer2Name'],
            redPlayer3Name: maps[i]['redPlayer3Name'],
            redPlayer4Name: maps[i]['redPlayer4Name'],
            redPlayer5Name: maps[i]['redPlayer5Name'],
            redTeamName: maps[i]['redTeamName']));
  }

  Future<void> updateData(Data data) async {
    final db = await database;
    await db.update('savedData', data.toMap(),
        where: 'id = ?', whereArgs: [data.id]);
  }

  Future<void> deleteData(int id) async {
    final db = await database;
    await db.delete('savedData', where: 'id = ?', whereArgs: [id]);
  }
}

class Data {
  final int id;
  final String name;
  final String blueBan1;
  final String blueBan2;
  final String blueBan3;
  final String blueBan4;
  final String blueBan5;
  final String bluePlayer1;
  final String bluePlayer1Name;
  final String bluePlayer2;
  final String bluePlayer2Name;
  final String bluePlayer3;
  final String bluePlayer3Name;
  final String bluePlayer4;
  final String bluePlayer4Name;
  final String bluePlayer5;
  final String bluePlayer5Name;
  final String blueTeamName;
  final String redBan1;
  final String redBan2;
  final String redBan3;
  final String redBan4;
  final String redBan5;
  final String redPlayer1;
  final String redPlayer1Name;
  final String redPlayer2;
  final String redPlayer2Name;
  final String redPlayer3;
  final String redPlayer3Name;
  final String redPlayer4;
  final String redPlayer4Name;
  final String redPlayer5;
  final String redPlayer5Name;
  final String redTeamName;

  Data({
    required this.id,
    required this.name,
    required this.blueBan1,
    required this.blueBan2,
    required this.blueBan3,
    required this.blueBan4,
    required this.blueBan5,
    required this.bluePlayer1,
    required this.bluePlayer2,
    required this.bluePlayer3,
    required this.bluePlayer4,
    required this.bluePlayer5,
    required this.bluePlayer1Name,
    required this.bluePlayer2Name,
    required this.bluePlayer3Name,
    required this.bluePlayer4Name,
    required this.bluePlayer5Name,
    required this.blueTeamName,
    required this.redBan1,
    required this.redBan2,
    required this.redBan3,
    required this.redBan4,
    required this.redBan5,
    required this.redPlayer1,
    required this.redPlayer2,
    required this.redPlayer3,
    required this.redPlayer4,
    required this.redPlayer5,
    required this.redPlayer1Name,
    required this.redPlayer2Name,
    required this.redPlayer3Name,
    required this.redPlayer4Name,
    required this.redPlayer5Name,
    required this.redTeamName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'blueBan1': blueBan1,
      'blueBan2': blueBan2,
      'blueBan3': blueBan3,
      'blueBan4': blueBan4,
      'blueBan5': blueBan5,
      'bluePlayer1': bluePlayer1,
      'bluePlayer2': bluePlayer2,
      'bluePlayer3': bluePlayer3,
      'bluePlayer4': bluePlayer4,
      'bluePlayer5': bluePlayer5,
      'bluePlayer1Name': bluePlayer1Name,
      'bluePlayer2Name': bluePlayer2Name,
      'bluePlayer3Name': bluePlayer3Name,
      'bluePlayer4Name': bluePlayer4Name,
      'bluePlayer5Name': bluePlayer5Name,
      'blueTeamName': blueTeamName,
      'redBan1': redBan1,
      'redBan2': redBan2,
      'redBan3': redBan3,
      'redBan4': redBan4,
      'redBan5': redBan5,
      'redPlayer1': redPlayer1,
      'redPlayer2': redPlayer2,
      'redPlayer3': redPlayer3,
      'redPlayer4': redPlayer4,
      'redPlayer5': redPlayer5,
      'redPlayer1Name': redPlayer1Name,
      'redPlayer2Name': redPlayer2Name,
      'redPlayer3Name': redPlayer3Name,
      'redlayer4Name': redPlayer4Name,
      'redPlayer5Name': redPlayer5Name,
      'redTeamName': redTeamName,
    };
  }

  @override
  String toString() {
    return 'Data{id: $id, name: $name, blueBan1: $blueBan1, blueBan2: $blueBan2, blueBan3: $blueBan3, blueBan4: $blueBan4, blueBan5: $blueBan5, bluePlayer1: $bluePlayer1, bluePlayer2: $bluePlayer2, bluePlayer3: $bluePlayer3, bluePlayer4: $bluePlayer4, bluePlayer5: $bluePlayer5, bluePlayer1Name: $bluePlayer1Name, bluePlayer2Name: $bluePlayer2Name, bluePlayer3Name: $bluePlayer3Name, bluePlayer4Name: $bluePlayer4Name, bluePlayer5Name: $bluePlayer5Name, blueTeamName: $blueTeamName, redBan1: $redBan1, redBan2: $redBan2, redBan3: $redBan3, redBan4: $redBan4, redBan5: $redBan5, redPlayer1: $redPlayer1, redPlayer2: $redPlayer2, redPlayer3: $redPlayer3, redPlayer4: $redPlayer4, redPlayer5: $redPlayer5, redPlayer1Name: $redPlayer1Name, redPlayer2Name: $redPlayer2Name, redPlayer3Name: $redPlayer3Name, redPlayer4Name: $redPlayer4Name, redPlayer5Name: $redPlayer5Name, redTeamName: $redTeamName}';
  }
}
