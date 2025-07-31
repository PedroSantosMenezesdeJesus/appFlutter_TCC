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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        
        appBar: AppBar(
          title: const Text('app tcc', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
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

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FilledButton.icon(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const CreatorsPag()),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                      minimumSize: WidgetStatePropertyAll<Size>(Size(250, 95)),
                    ), 
                    icon: Icon(Icons.people_alt_rounded, size: 25,),
                    label: const Text('Criadores', textScaler: TextScaler.linear(2))
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FilledButton.icon(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const FiguraPag()),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                      minimumSize: WidgetStatePropertyAll<Size>(Size(250, 95)),
                    ), 
                    icon: Icon(Icons.tag_faces, size: 25,),
                    label: const Text('Figurinha', textScaler: TextScaler.linear(2))
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FilledButton.icon(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const JogoPag()),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                      minimumSize: WidgetStatePropertyAll<Size>(Size(250, 95)),
                    ), 
                    icon: Icon(Icons.games, size: 25,),
                    label: const Text('Jogo', textScaler: TextScaler.linear(2))
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FilledButton.icon(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const QuizPag()),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                      minimumSize: WidgetStatePropertyAll<Size>(Size(250, 95)),
                    ), 
                    icon: Icon(Icons.quiz, size: 25,),
                    label: const Text('Quiz', textScaler: TextScaler.linear(2))
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: FilledButton.icon(
                    onPressed: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const PersonagemPag()),
                    ),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(Color.fromRGBO(29, 60, 124, 1)),
                      minimumSize: WidgetStatePropertyAll<Size>(Size(250, 95)),
                    ), 
                    icon: Icon(Icons.tag_faces, size: 25,),
                    label: const Text('Personagens', textScaler: TextScaler.linear(2))
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
