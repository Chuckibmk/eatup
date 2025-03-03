// import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'eatup.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE shops(
            id INTEGER PRIMARY KEY,
            name TEXT,
            subtitle TEXT,
            description TEXT,
            tabs TEXT,
            image TEXT,
            section TEXT,
            uqid TEXT,
            date INTEGER
          )
        ''');
      },
    );
  }

  Future<void> inserShops(List<Map<String, dynamic>> shopList) async {
    final db = await database;
    for (var shop in shopList) {
      await db.insert(
        'shops',
        shop,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getShops() async {
    final db = await database;
    return db.query('shops');
  }
}
