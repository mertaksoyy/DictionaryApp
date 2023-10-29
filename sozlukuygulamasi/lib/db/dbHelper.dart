import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dbHelper{

  static final String dbName = "kelimeler.sqlite";

  static Future<Database> dbAccess() async{
    String dbPath = join(await getDatabasesPath(),dbName);

    if(await databaseExists(dbPath)){//Veritabanı var mı yok mu kontrolü
      print("Db has already copied");
    }
    else{
      //assetten veritabanının alınması
      ByteData data = await rootBundle.load("database/$dbName}");
      //Veritabanının kopyalama için byte dönüşümü
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes,flush:true);
      print("DB Copied");
    }
    //Veritabanını açıyoruz.
    return openDatabase(dbPath);
  }
}







