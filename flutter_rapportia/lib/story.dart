import 'package:flutter/material.dart';

void storypag() {
  runApp(const StoryPag());
}

class StoryPag extends StatelessWidget{
  const StoryPag({super.key});

  @override

  Widget build(BuildContext context) {

    final ScrollController controle = ScrollController();

    return Scaffold(

      backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        appBar: AppBar(
          title: const Text('Historia'),
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
                      Text('História')
                    ],
                  ),
                );
              },
            ),
          ),
        ),
    );
  }
}