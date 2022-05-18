import 'package:flutter/material.dart';
import '../enrutador/rute.dart';
import '../models/option.dart';

/**
 * este es el menu principal de la aplicacion
 */
class InicialScreen extends StatelessWidget {
  const InicialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.blueGrey);

    //TODO:also change this
    InitialScreenArguments? arguments =
        ModalRoute.of(context)!.settings.arguments as InitialScreenArguments?;

    return Scaffold(
      appBar: AppBar(title: const Text("Learno")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO:change this it is neccesary
            Text("bienvenido"),
            Text("tu progreso semanal"),
            Center(
              child: Container(
                  margin: const EdgeInsets.all(20.0),
                  color: Colors.blue,
                  width: 440.0,
                  height: 250.0),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {},
              child: const Text('Crear nuevo'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  child: Text(
                    'Tus objetivos',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Calculo ll'),
                      ElevatedButton(
                        style: style,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, MyEnrouter.menuOptions[4].ruta);
                        },
                        child: const Text('Comenzar'),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
