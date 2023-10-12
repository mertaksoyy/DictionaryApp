import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  const DetaySayfa({super.key});

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
            Text("data"),
            Text("data");
          ],
        ),
      ),

    );
  }
}
