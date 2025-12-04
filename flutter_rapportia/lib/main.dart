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

  // criando uma lista das paginas do aplicativo para serem usados no bottomNavigationBar
  final List<Widget> pages = [
    StoryPag(),
    PersonagemPag(),
    GaleriaPag(),
    MapaPag(),
    MusicPag()
  ];

  // variavel int que serve para que mude de valor se relacionando com o valor da lista
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(

        //criação de um BottomNavigationBar
        bottomNavigationBar: BottomNavigationBar(

          // Propriedade do BottomNavigationBar que será igual ao valor da variavel currentPage
          currentIndex: currentPage,

          // ao toque muder o valor da currentPage para o valor value
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },

          // São os itens do BottomNavigationBar que ao toque ativam o onTap, o que mudará o valor do currentPage
          
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
        // essa linha siginifica que o body da tela main pega o valor da lista pages igual a o valor da currentPage assim fazendo com que mostre a outras telas
        body: pages[currentPage]
      ),
    );
  }
}
