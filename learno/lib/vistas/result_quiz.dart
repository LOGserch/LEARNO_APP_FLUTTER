import 'package:flutter/material.dart';
import '../classes/quiz.dart';

class ResultQuizScreen extends StatelessWidget {
  const ResultQuizScreen({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.name),
        elevation: 0,
      ),
      body: Center(
        child: Column(children: [
          Container(
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 2,
                right: 2,
                top: 2,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white,
                width: 1,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('preguntas: ${quiz.questions.length}'),
                  Text('correctas: ${quiz.percent}%'),
                ],
              )),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz.questions.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: quiz.questions[index].correct
                          ? Colors.green.shade200
                          : Colors.red.shade200,
                      child: ListTile(
                          leading: quiz.questions[index].correct
                              ? Icon(Icons.check, color: Colors.green.shade900)
                              : Icon(Icons.close, color: Colors.red.shade900),
                          title: Text(
                            quiz.questions[index].question,
                          ),
                          subtitle: Text(quiz.questions[index].selected),
                          trailing: Text(quiz.questions[index].answer)),
                    );
                  })),
        ]),
      ),
    );
  }
}
