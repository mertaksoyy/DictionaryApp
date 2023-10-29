import 'package:flutter/material.dart';
import 'package:sozlukuygulamasi/DetaySayfa.dart';
import 'package:sozlukuygulamasi/db/dictionaryDao.dart';
import 'Kelimeler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home:  const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});


  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
   bool isSearching = false;
   String searchedWord = "";

   Future<List<Kelimeler>> allWords() async{
     var words = await dictionaryDao().allWords();
     return words;
   }

   Future<List<Kelimeler>> doSearch(String searchedWord) async{
    var words = await dictionaryDao().searchWord(searchedWord);
     return words;

   }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: isSearching ?
        TextField(
          decoration: InputDecoration(hintText: "Kelime girin"),
          onChanged: (searchResult){
          print("Aranan Kelime : ${searchResult}");
          setState(() {
            searchedWord = searchResult;
            });
          },
        ) :const Text("Sözlük Uygulaması"),
        actions: [
          isSearching ?IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                isSearching = false;
                searchedWord = "";
              });
            },
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                isSearching = true;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<Kelimeler>>(
        future:allWords(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var incomingWords = snapshot.data;
            
           return ListView.builder(
              itemCount: incomingWords!.length,
              itemBuilder: (context,indeks){
                var word = incomingWords[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kelime: word,)));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(word.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(word.turkce),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            return Center();
          }
        },
      ),
    );
  }
}
