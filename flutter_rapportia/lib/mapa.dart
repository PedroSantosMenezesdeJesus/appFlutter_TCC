import 'package:flutter/material.dart';

void mapapag() {
  runApp(const MapaPag());
}

class MapaPag extends StatelessWidget{
  const MapaPag({super.key});

  @override

  Widget build(BuildContext context) {
    final ScrollController controle = ScrollController();

    return Scaffold(

      //backgroundColor: Color.fromRGBO(241, 191, 39, 1),
        
        /*appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
        ),*/

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
                    //color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,

                    children: [
                      Text('Mapa', style: TextStyle(fontFamily: 'Sunshiney', fontSize: 48, color: const Color.fromRGBO(0, 0, 0, 1))),

                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              child: Image.asset('img/mapa.png', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.fill),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(-0.20, -0.20),
                                child: Image.asset('img/cidade.png', width: 100, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(0.50, -0.20),
                                child: Image.asset('img/caverna.png', width: 100, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(-1, 1),
                                child: Image.asset('img/deserto.png', width: 100, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(-0.20, 0.20),
                                child: Image.asset('img/pantano.png', width: 100, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(1, -1),
                                child: Image.asset('img/torre.png', width: 100, height: 100,),
                              ),
                            ),
                          ],
                        ),
                      ),
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