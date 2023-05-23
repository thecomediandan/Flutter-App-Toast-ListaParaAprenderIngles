import 'package:flutter/material.dart';
import 'package:flutter_app_list_english/controllers/my_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final List<Map<String, String>> listaOperaciones = [
      {
        'titulo': 'LUNES (LISTENING ACTIVO)',
        'descripcion':
            '- Escoge una canción que te guste, busca la letra y cántala mientras vas siguiendo la letra.\n- Lee la canción como si estuvieras contando una historia.\n- Busca las palabras que no conozcas, anótalas y haz oraciones con ellas.'
      },
      {
        'titulo': 'MARTES (WRITING)',
        'descripcion':
            '- Escribe una lista de las cosas que harás en el día. Escribe desde lo que tienes que hacer en el trabajo, en tu casa y también tus actividades de entrenamiento.'
      },
      {
        'titulo': 'MIÉRCOLES (PRACTICING VOCABULARY)',
        'descripcion':
            '- Escoge una foto (puede ser una foto de tu carpeta o una foto que veas en redes sociales)\n- Describe la imagen. Aquí intenta describir todo lo que puedas (que está pasando en la foto, como se ven las personas/animales/cosas, como es el clima, que te transmite,etc.)'
      },
      {
        'titulo': 'JUEVES (READING)',
        'descripcion':
            '- Busca una noticia corta (puede ser incluso una noticia de un post en instagram).\n- Léela en voz alta\n- Tradúcela, y no te estanques, si no sabes una palabra, la idea general de la noticia, te la da todo el contexto del texto.'
      },
      {
        'titulo': 'VIERNES (SPEAKING AND WRITING)',
        'descripcion':
            '- Ve a "learnhip.com" y selecciona la opción "Story Cards"\n- Con las primeras 4 imágenes, escribe una historia.\n- Con las 4 imágenes de abajo, cuenta una historia (hablada).'
      },
      {
        'titulo': 'SÁBADO (SPEAKING AND LISTENING)',
        'descripcion':
            '- Graba un audio contando tus planes para el fin de semana (sé lo más detallado que puedas)\n- Escucha el audio y checa la pronunciación de las palabras con las que tengas dudas.'
      },
      {
        'titulo': 'DOMINGO (PRONUNCIATION)',
        'descripcion':
            '- Busca un trabalenguas en inglés.\n- Empieza por leerlo lento.\n- Busca la pronunciación de las palabras con las que tengas dudas.\n- Después intenta leerlo fluido (no rápido, fluido).'
      }
    ];
    // print(_ListaOperaciones[0].values.toList()[0]);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Lista para aprender Inglés'),
          centerTitle: true,
          leading: Row(
            children: const [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://thumbs.dreamstime.com/b/perro-rojo-lindo-y-divertido-del-inu-de-shiba-con-el-tonque-que-cuelga-hacia-fuera-sentarse-en-campo-la-puesta-sol-retrato-primer-146659946.jpg'),
              ),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextFormField(
              focusNode: focusNode,
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Prueba el ToastFlutter...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                fillColor: const Color.fromARGB(255, 34, 75, 54),
                filled: true,
                suffixIcon: IconButton(
                    onPressed: () {
                      FToast()
                          .init(context)
                          .showToast(child: Text(textController.value.text));
                      textController.clear();
                    },
                    icon: const Icon(Icons.send_outlined)),
              ),
              onFieldSubmitted: (value) {
                // FToast()
                //     .init(context)
                //     .showToast(child: Text(textController.value.text));
                FToast().init(context).showToast(
                      child: MyToast(msg: textController.value.text),
                      toastDuration: const Duration(seconds: 2),
                      gravity: ToastGravity.TOP,
                      fadeDuration: const Duration(seconds: 1),
                      // positionedToastBuilder: (context, child) {
                      //   return Positioned(
                      //     child: child,
                      //     top: 16.0,
                      //     left: 16.0,
                      //   );
                      // }
                    );
                textController.clear();
                focusNode.requestFocus();
              },
              onTapOutside: (event) {
                focusNode.unfocus();
              },
            ),
            Expanded(
                child: ListView.builder(
              itemCount: listaOperaciones.length,
              itemBuilder: (context, index) {
                final String title = listaOperaciones[index].values.toList()[0];
                final String desc = listaOperaciones[index].values.toList()[1];
                return _ItemEnglish(
                  titulo: title,
                  descripcion: desc,
                );
              },
            ))
          ]),
        ),
      ),
    );
  }
}

class _ItemEnglish extends StatelessWidget {
  const _ItemEnglish({required this.titulo, required this.descripcion});

  final String titulo;
  final String descripcion;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            // width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            child: Text(
              titulo,
            ),
          ),
          Text(
            descripcion,
          ),
        ],
      ),
    );
  }
}
