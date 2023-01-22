import 'package:flutter/material.dart';
import 'package:walkmehome/pages/navbar.dart';

class PopPage extends StatefulWidget {
  const PopPage({super.key});

  @override
  State<PopPage> createState() => PopPageState();
}

class PopPageState extends State<PopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[400],
      appBar: AppBar(
        title: Text('D E S T I N A T I O N  I N F O'),
      ),
      body: Padding(
          //Put map here
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.deepOrange[400],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.deepOrange[300],
                        height: 120,
                      ),
                    );
                  }),
            ),
          ])),
    );
  }
}
