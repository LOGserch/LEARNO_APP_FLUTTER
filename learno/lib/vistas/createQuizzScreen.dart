import 'package:flutter/material.dart';

/**
 * aqui se va a crear lo que es la vista de crear nuevo quizz
 * 
 */
class CreateQuizzScreen extends StatelessWidget {
  CreateQuizzScreen({Key? key}) : super(key: key);
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.lightBlue);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('crear quizz'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "nombre",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "categoria",
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {},
                            child: const Text('crear nueva pregunta'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {},
                            child: const Text('crear quizz'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
