import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:learno/enrutador/rute.dart';

/**
 * menu de quizzes creados para una materia en concreto
 */
class QuizzScreen extends StatelessWidget {
  const QuizzScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.blueGrey);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizz'),
        centerTitle: true,
      ),
      body: Container(
        width: 360.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text('geografia I'),
                        ),
                        ElevatedButton(
                          style: style,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, MyEnrouter.menuOptions[7].ruta);
                          },
                          child: const Text('Comenzar'),
                        ),
                      ]),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text('Matematicas l'),
                        ),
                        ElevatedButton(
                          style: style,
                          onPressed: () {},
                          child: const Text('Comenzar'),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        backgroundColor: Color.fromARGB(255, 5, 125, 211),
        visible: true,
        curve: Curves.bounceInOut,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: 'crear',
            onTap: () {
              Navigator.pushNamed(context, MyEnrouter.menuOptions[2].ruta);
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.close),
            label: 'eliminar',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.update),
            label: 'actualizar',
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.share),
            label: 'compartir',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
