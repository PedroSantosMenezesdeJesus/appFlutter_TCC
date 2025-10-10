import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/mapa_class.dart';

void mapapag() {
  runApp(
    const MaterialApp(
      title: "Mapa",
      home: MapaPag(),
    )
  );
}

class MapaPag extends StatefulWidget{
  const MapaPag({super.key});

  @override
  MapaPAG createState() => MapaPAG();
}

class MapaPAG extends State{

  List<Mapa> mapa = List.empty(growable: true);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/mapa.json');
      Iterable data = await json.decode(response);
    mapa = List<Mapa>.from(data.map((model) => Mapa.fromJson(model)));

    setState(() {
      mapa;
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

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
                              child: Image.asset('img/mapa.png', scale: 0.1, height: MediaQuery.of(context).size.height *0.8, fit: BoxFit.fill),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(-0.20, -0.20),
                                child: Image.asset(mapa[0].img, scale: 2, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(0.50, -0.20),
                                child: Image.asset(mapa[2].img, scale: 2, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(-1, 0.8),
                                child: Image.asset(mapa[3].img, scale: 2, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(-0.20, 0.20),
                                child: Image.asset(mapa[4].img, scale: 2, height: 100,),
                              ),
                            ),

                            Container(
                              child: Align(
                                alignment: Alignment(1, -1),
                                child: Image.asset(mapa[5].img, scale: 2, height: 100,),
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