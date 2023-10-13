import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sozlukuygulamasi/Kelimeler.dart';

class DetaySayfa extends StatefulWidget {
   DetaySayfa({super.key,required this.kelime});

  Kelimeler kelime;


  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("Ayrıntı Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.kelime.ingilizce,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
            Text(widget.kelime.turkce,style: TextStyle(fontSize: 40,),)
          ]
        ),
      ),
    );
  }
}
