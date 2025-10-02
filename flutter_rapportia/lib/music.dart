import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_rapportia/musicas.dart';
import 'package:just_audio/just_audio.dart';

void musicpag() {
  runApp( 
    const MaterialApp(
      title: "musica", 
      home: MusicPag(),
    )
  );
}

class MusicPag extends StatefulWidget{
  const MusicPag({super.key});

  @override 
  MusicPAG createState() => MusicPAG();
}

class MusicPAG extends State{

  List<Musicas> musicas = List.empty(growable: true);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/music.json');
     Iterable data = await json.decode(response);
    musicas = List<Musicas>.from(data.map((model) => Musicas.fromJson(model)));

    setState(() {
      musicas;
    });
  }

  //progamar o audio
  final player = AudioPlayer();

    String formatDuration(Duration d) {
      final minutes = d.inMinutes.remainder(60);
      final seconds = d.inSeconds.remainder(60);
      return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
    }

    void handlePlayPause() {
      if (player.playing) {
        player.pause();
      } else {
        player.play();
      }
    }

    void handleSeek(double value) {
      player.seek(Duration(seconds: value.toInt()));
    }

    Duration position = Duration.zero;
    Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
      readJson();

     // player.setAsset();

     player.positionStream.listen((p) {
      setState(() => position = p);
     });

     player.durationStream.listen((d) {
      setState(() => duration = d!);
     });
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

                      Text("Trilha Sono", style: TextStyle(fontFamily: 'Sunshiney', fontSize: 36, color:Color.fromRGBO(0, 0, 0, 1))),


                      Expanded(
                        child: ListView.builder(

                          itemCount: musicas.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(5),
                          scrollDirection: Axis.vertical,
                          clipBehavior: Clip.antiAlias,

                          itemBuilder: (BuildContext ctx, index) 
                          {
                            return Card
                            (
                              margin: EdgeInsets.all(32),

                              child: Padding
                              (
                                padding: EdgeInsets.all(16),
                                child: Text(musicas[index].nome, style: TextStyle(fontFamily: 'Sunshiney', fontSize: 24),),
                              ),
                            );
                          },
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