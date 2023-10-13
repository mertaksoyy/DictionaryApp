import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dbHelper{

  static String dbName = "kelimeler.sqlite";

  static Future<Database> dbAccess() async{
    var dbPath = join(await getDatabasesPath(),dbName);

    if(await databaseExists(dbPath)){
      print("Db has already copied");
    }
    else{
      ByteData data = await rootBundle.load("database/$dbName}");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

      await File(dbPath).writeAsBytes(bytes,flush:true);
    }
    return openDatabase(dbPath);
  }
}