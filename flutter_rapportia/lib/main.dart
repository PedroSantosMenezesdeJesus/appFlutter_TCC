import 'package:flutter/material.dart';
//telas
import 'package:flutter_rapportia/personagens.dart';
import 'package:flutter_rapportia/galeria.dart';
import 'package:flutter_rapportia/mapa.dart';
import 'package:flutter_rapportia/music.dart';
import 'package:flutter_rapportia/story.dart';

void main() {
  runApp(const MaterialApp(title: 'App',
  home: MainApp(), ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State{

  final List<Widget> pages = [
    StoryPag(),
    PersonagemPag(),
    GaleriaPag(),
    MapaPag(),
    MusicPag()
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },

          items: [

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(104, 121, 73, 1),
              icon: Icon(Icons.book),
              label: "HISTÓRIA"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(104, 121, 73, 1),
              icon: Icon(Icons.tag_faces),
              label: "PERSONAGENS"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(104, 121, 73, 1),
              icon: Icon(Icons.image_rounded),
              label: "GALERIA"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(104, 121, 73, 1),
              icon: Icon(Icons.map),
              label: "MAPA"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(104, 121, 73, 1),
              icon: Icon(Icons.multitrack_audio),
              label: "MÚSICA"
            )

          ]
        ),

        body: pages[currentPage]
      ),
    );
  }
}