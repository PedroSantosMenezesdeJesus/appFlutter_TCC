# appFlutter_TCC

https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

´´´
import 'package:flutter/material.dart';
import 'package:flutter_rapportia/personagens.dart';
import 'package:flutter_rapportia/jogo.dart';
import 'package:flutter_rapportia/galeria.dart';
import 'package:flutter_rapportia/mapa.dart';
import 'package:flutter_rapportia/music.dart';

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

  @override
  Widget build(BuildContext context) {

    //final screenWitdh = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    final ScrollController controle = ScrollController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        
        appBar: AppBar(
          title: const Text('APP TCC'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),

        

        body: Center(    

          child: Scrollbar(

            trackVisibility: true,
            thumbVisibility: true,
            thickness: 10,
            radius: const Radius.circular(20),
            interactive: true,
            controller: controle,
            
            child: ListView.builder(

              controller: controle,
              itemCount: 1,
              itemBuilder: (context, index) {

                return Container(

                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                    color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          onPressed: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const JogoPag()),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                            minimumSize: WidgetStatePropertyAll(Size(200,100))
                          ), 
                          icon: Icon(Icons.games),
                          label: const Text('Jogo')
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          onPressed: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const PersonagemPag()),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                            minimumSize: WidgetStatePropertyAll(Size(200,100))
                          ), 
                          icon: Icon(Icons.tag_faces),
                          label: const Text('Personagens')
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          onPressed: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const GaleriaPag()),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                            minimumSize: WidgetStatePropertyAll(Size(200,100))
                          ), 
                          icon: Icon(Icons.image),
                          label: const Text('Galeria')
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          onPressed: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const MapaPag()),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                            minimumSize: WidgetStatePropertyAll(Size(200,100))
                          ), 
                          icon: Icon(Icons.map),
                          label: const Text('Mapa do jogo')
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton.icon(
                          onPressed: () => Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const MusicPag()),
                          ),
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                            minimumSize: WidgetStatePropertyAll(Size(200,100))
                          ), 
                          icon: Icon(Icons.music_note),
                          label: const Text('Música do jogo')
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

´´´
