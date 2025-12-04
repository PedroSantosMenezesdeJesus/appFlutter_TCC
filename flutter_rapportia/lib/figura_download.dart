import 'package:flutter/material.dart';
import 'package:flutter_rapportia/figurinha.dart';
import 'dart:io';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void figurapag() {
  runApp(const FiguraPag());
}

class FiguraPag extends StatelessWidget{
  const FiguraPag({super.key});

  @override
  Widget build(BuildContext context) {

    // pega os valores indexs, via o settings.arguments para ter os valores atribuidados ao index do botão
    final figurinha = ModalRoute.of(context)!.settings.arguments as Figurinha;

    final ScrollController controle = ScrollController();

    // função de download das figuras, ele pega a figurinha pelo link dela, e cria um arquivo com o nome da figura para ser baixado no disco do usuario
    
    Future <void> downloadFigura(BuildContext) async {
      String? message;
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      try {
        final http.Response response = await http.get(Uri.parse(figurinha.link));

        final dir = await getTemporaryDirectory();

        var  filename = "${dir.path}/${figurinha.nome}.png";

        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);

        final params = SaveFileDialogParams(sourceFilePath: file.path);
        final finalPath = await FlutterFileDialog.saveFile(params: params);

        if (finalPath != null) {
          message = "figura salva no disco";
        }

      } catch (e) {
        message = 'Erro ao baixar a figura: $e';
      }

      if (message != null) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text(message)));
      }
    }
    
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
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(
                  //color: Color.fromRGBO(16, 25, 50, 1),
                  borderRadius: BorderRadius.circular(16)
                ),    

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  // local aonde se mostra o nome e imagem da figurinha
                  children: [
                    Padding(padding: EdgeInsets.all(8)),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2
                        )
                      ),
                      child: Image.asset(figurinha.figura, width: 300, height: 300, fit: BoxFit.cover,)
                    ),

                    Padding(padding: EdgeInsets.all(16)),

                    // botão que ao ser clicado chama a função downloadFigura
                    ElevatedButton.icon(
                      onPressed: () => downloadFigura(context),
                      style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size(200, 70)),
                      ), 
                      label: Text("Baixar", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1), fontFamily: 'Sunshiney', fontSize: 36)),
                      icon: Icon(Icons.download, size: 36, color: Colors.black,),
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
