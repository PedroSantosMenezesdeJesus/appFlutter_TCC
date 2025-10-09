import 'package:flutter/material.dart';
import 'package:flutter_rapportia/musicas.dart';
import 'package:just_audio/just_audio.dart';

void musicPlaypag() {
  runApp(
    const MaterialApp(
      title: "tocando musica",
      home: MusicPlayPag(),
    )
  );
}

class MusicPlayPag extends StatefulWidget{
  const MusicPlayPag({super.key});

  @override
  MusicPlayPAG createState() => MusicPlayPAG();
}

class MusicPlayPAG extends State<MusicPlayPag>{

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

  void tocarMusica(musica) {
    
    setState(() {
      player.setAsset(musica.music);
      
    });
  }

  @override
  void initState() {
    super.initState();

    player.positionStream.listen((p) {
      setState(() => position = p);
    });

    player.durationStream.listen((d) {
      setState(() => duration = d!);
    }); 

    player.playerStateStream.listen((state) {
      if(state.processingState == ProcessingState.completed) {
        setState(() {
        position = Duration.zero;
        });
        player.pause();
        player.seek(position);
      };
    });

  }

  @override
  Widget build(BuildContext context) {

    final musica= ModalRoute.of(context)!.settings.arguments as Musica;
    tocarMusica(musica);

    final ScrollController controle = ScrollController();

    return Scaffold(

      appBar: AppBar(),

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
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(
                  //color: Color.fromRGBO(16, 25, 50, 1),
                  borderRadius: BorderRadius.circular(16)
                ),

                child: Column(

                  children: [

                    Text(musica.nome, style: TextStyle(fontFamily: 'Sunshiney', fontSize: 48, color:Color.fromRGBO(0, 0, 0, 1))),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 2
                          )
                        ),
                        child: Image.asset(musica.img, width: 400, height: 400, fit: BoxFit.cover,),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          //color: Color.fromRGBO(29, 60, 124, 1),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                            width: 2
                          )
                        ),
                      
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 2,
                        
                          children: [
                            Text(formatDuration(position)),
                            
                            Slider(
                                min: 0.0,
                                max: duration.inSeconds.toDouble(),
                                value: position.inSeconds.toDouble(), 
                                onChanged: handleSeek,
                              ),
                            
                            Text(formatDuration(duration)),
                            
                            IconButton(
                              icon: Icon(player.playing ? Icons.pause : Icons.play_arrow),
                              onPressed: handlePlayPause,
                            )
                          ],
                        ),

                      ),
                    ),
                    
                  ],
                ),
              );
            }
          )
        ),
      ),
    );
  }
}