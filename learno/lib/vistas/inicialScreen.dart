import 'package:flutter/material.dart';

// ignore: camel_case_types
class inicialScreen extends StatelessWidget {
  const inicialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20), primary: Colors.blueGrey);

    return Scaffold(
      appBar: AppBar(title: const Text("Learno")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("hola de nuevo, sergioVG"),
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
              child: const Text('Comenzar'),
            ),
            Center(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Calculo ll'),
                      ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: const Text('Comenzar'),
                      ),
                    ]),
              ),
            ),
            Center(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Matematicas l'),
                      ElevatedButton(
                        style: style,
                        onPressed: () {},
                        child: const Text('Comenzar'),
                      ),
                    ]),
              ),
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Geografia'),
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
    );
  }
}
