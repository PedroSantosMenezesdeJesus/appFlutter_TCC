import 'package:flutter/material.dart';
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

  @override
  void initState() {super.initState();}

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
              backgroundColor: Color.fromRGBO(29, 60, 124, 1),
              icon: Icon(Icons.book),
              label: "HISTÓRIA"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(29, 60, 124, 1),
              icon: Icon(Icons.tag_faces),
              label: "PERSONAGENS"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(29, 60, 124, 1),
              icon: Icon(Icons.image),
              label: "GALERIA"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(29, 60, 124, 1),
              icon: Icon(Icons.map),
              label: "MAPA"
            ),

            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(29, 60, 124, 1),
              icon: Icon(Icons.music_note),
              label: "MÚSICA"
            )

          ]
        ),

        body: pages[currentPage]
      ),
    );
  }
}