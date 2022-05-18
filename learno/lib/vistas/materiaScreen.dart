import 'package:flutter/material.dart';
import 'package:learno/enrutador/rute.dart';

/**
 * configuracion y inicio de la materia a estudiar
*/
class MateriaScreen extends StatelessWidget {
  const MateriaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.blueGrey);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matematicas l'),
        centerTitle: true,
      ),
      body: Container(
        width: 360.0,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, MyEnrouter.menuOptions[6].ruta);
                    },
                    child: const Text('quizz rapido'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('sesion personalizada'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('mis estadisticas'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('mis logros'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
