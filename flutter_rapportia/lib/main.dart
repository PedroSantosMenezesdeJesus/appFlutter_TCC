import 'package:flutter/material.dart';
import 'package:flutter_rapportia/personagens.dart';
import 'package:flutter_rapportia/jogo.dart';
import 'package:flutter_rapportia/quiz.dart';
import 'package:flutter_rapportia/figurinha.dart';
import 'package:flutter_rapportia/creators.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        
        appBar: AppBar(
          title: const Text('app tcc'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),

        body: Center(    

          child: Container(
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

                FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const CreatorsPag()),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                  ), 
                  icon: Icon(Icons.people_alt_rounded),
                  label: const Text('Criadores')
                ),

                FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const FiguraPag()),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                  ), 
                  icon: Icon(Icons.tag_faces),
                  label: const Text('Figurinha')
                ),

                FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const JogoPag()),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                  ), 
                  icon: Icon(Icons.games),
                  label: const Text('Jogo')
                ),

                FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const QuizPag()),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                  ), 
                  icon: Icon(Icons.quiz),
                  label: const Text('Quiz')
                ),

                FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => const PersonagemPag()),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                  ), 
                  icon: Icon(Icons.tag_faces),
                  label: const Text('Personagens')
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
