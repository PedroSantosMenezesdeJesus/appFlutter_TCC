import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/figurinha.dart';

void galeriapag() {
  runApp(
    const MaterialApp( 
      title: "Galeria",
      home: GaleriaPag()
    )
  );
}

class GaleriaPag extends StatefulWidget{
  const GaleriaPag({super.key});

  @override
  GaleriaPAG createState() => GaleriaPAG();
}

class GaleriaPAG extends State{

  List<Figurinha> figurinha = List.empty(growable: true);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/figuras.json');
      Iterable data = await json.decode(response);
    figurinha = List<Figurinha>.from(data.map((model) => Figurinha.fromJson(model)));

    setState(() {
      figurinha;
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
        
        appBar: AppBar(
          centerTitle: true,
          //backgroundColor: const Color.fromRGBO(29, 60, 124, 1),
          
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
                    //color: Color.fromRGBO(16, 25, 50, 1),
                    borderRadius: BorderRadius.circular(16)
                  ),    

                  child: GridView.count(
                    crossAxisCount: 1,
                    children: [

                      Expanded(
                        child: ListView.builder(

                          itemCount: figurinha.length,
                          padding: EdgeInsets.all(5),
                          itemBuilder: (BuildContext ctx, index){

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                Image.asset(figurinha[index].figura, width: 100, height: 100,)
                              ],
                            );

                          }
                        )
                      )
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