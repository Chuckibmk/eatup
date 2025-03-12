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
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE shops(
            id INTEGER PRIMARY KEY,
            name TEXT,
            subtitle TEXT,
            description TEXT,
            tabs TEXT,
            image BLOB,
            section TEXT,
            uqid TEXT,
            date INTEGER
          )
        ''');

        // Create 'section' table
        await db.execute('''
          CREATE TABLE section(
            id INTEGER PRIMARY KEY,
            name TEXT,
            subtitle TEXT,
            image BLOB,
            uqid TEXT,
            date INTEGER
          )
        ''');

        // Create 'item' table
        await db.execute('''
          CREATE TABLE item(
            id INTEGER PRIMARY KEY,
            name TEXT,
            details TEXT,
            price TEXT,
            image BLOB,
            category TEXT,
            shop TEXT,
            tabs TEXT,
            sku TEXT,
            stock TEXT,
            uqid TEXT,
            date INTEGER
          )
        ''');
      },
    );
  }

//shops
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

  Future<Map<String, dynamic>?> getShopById(int id) async {
    final db = await database; // Get database instance
    List<Map<String, dynamic>> result =
        await db.query('shops', where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return result.first; // Return shop data if found
    } else {
      return null; // Return null if shop is not found
    }
  }

  //general
  Future<void> insertGen(List<Map<String, dynamic>> genList, String g) async {
    final db = await database;
    for (var gen in genList) {
      await db.insert(
        g,
        gen,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Map<String, dynamic>>> getGen(String g) async {
    final db = await database;
    return db.query(g);
  }

  Future<Map<String, dynamic>?> getGenById(int id, String g) async {
    final db = await database; // Get database instance
    List<Map<String, dynamic>> result =
        await db.query(g, where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return result.first; // Return shop data if found
    } else {
      return null; // Return null if shop is not found
    }
  }
}
