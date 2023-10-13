import 'package:flutter/material.dart';
import 'package:sozlukuygulamasi/DetaySayfa.dart';
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

  bool aramaYapiliyorMu = false;
   String aramaKelimesi = "";

   Future<List<Kelimeler>> tumKelimeler() async{
     var kelimeListesi = <Kelimeler>[];

     var k1=Kelimeler(1, "dog", "köpek");
     var k2=Kelimeler(2, "cat", "kedi");
     var k3=Kelimeler(3, "apple", "elma");

     kelimeListesi.add(k1);
     kelimeListesi.add(k2);
     kelimeListesi.add(k3);

     return kelimeListesi;

   }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(hintText: "Kelime girin"),
          onChanged: (aramaSonucu){
          print("Aranan kelime : ${aramaSonucu}");
          setState(() {
            aramaKelimesi = aramaSonucu;
            });
          },
        ) :const Text("Sözlük Uygulaması"),
        actions: [
          aramaYapiliyorMu ?IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = false;
                aramaKelimesi = "";
              });
            },
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<Kelimeler>>(
        future: tumKelimeler(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var gelenKelimeler = snapshot.data;
            
           return ListView.builder(
              itemCount: gelenKelimeler!.length,
              itemBuilder: (context,indeks){
                var kelime = gelenKelimeler[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kelime: kelime,)));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kelime.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kelime.turkce),
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
