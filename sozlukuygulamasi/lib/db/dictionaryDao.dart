import 'package:sozlukuygulamasi/Kelimeler.dart';
import 'package:sozlukuygulamasi/db/dbHelper.dart';

class dictionaryDao{
    Future<List<Kelimeler>> allWords() async {
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler");

      return List.generate(maps.length, (i){
        var row = maps[i];
        return Kelimeler(row["kelime_id"], row["ingilizce"], row["ingilizce"]);
    });
  }


  Future<List<Kelimeler>> searchWord(String searchedWord) async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$searchedWord%'");
    //List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$searchedWord%' AND turkce like '%$searchedWord'");

    return List.generate(maps.length, (i){
      var row = maps[i];
      return Kelimeler(row["kelime_id"], row["ingilizce"], row["ingilizce"]);
    });
  }
  
}