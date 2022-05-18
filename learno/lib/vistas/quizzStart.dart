import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../classes/question.dart';
import '../classes/quiz.dart';
import '../screens.dart';

class QuizzStartScreen extends StatefulWidget {
  @override
  _QuizzStartState createState() => _QuizzStartState();
}

class _QuizzStartState extends State<QuizzStartScreen> {
  int totalQuestions = 5;
  int totalOptions = 4;
  int questionIndex = 0;
  int progressIndex = 0;
  Quiz quiz = Quiz(name: 'Quiz de cap', questions: []);
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/materias.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (i) => i);
    List<int> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);

      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['capital']);
      }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);

      if (quiz.questions.length >= totalQuestions) break;
    }

    setState(() {});
  }

//que se va a hacer antes de que inicie
  @override
  void initState() {
    super.initState();
    readJson();
  }

// para ver si la opcion esta bien o esta mal
  void _optionSelected(String selected) {
    quiz.questions[questionIndex].selected = selected;

    if (selected == quiz.questions[questionIndex].answer) {
      quiz.questions[questionIndex].correct = true;
      quiz.right += 1;
    }
    progressIndex += 1;
    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }

    setState(() {});
  }

  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('resultados'),
      backgroundColor: Colors.blue,
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('preguntas totales: $totalQuestions'),
            Text('preguntas correctas: ${quiz.right}'),
            Text('preguntas incorrectas: ${(totalQuestions - quiz.right)}'),
            Text('porcentaje: ${quiz.percent}%'),
          ]),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            //Navigator.pushNamed(context, MyEnrouter.menuOptions[8].ruta);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => ResultQuizScreen(
                        quiz: quiz,
                      ))),
            );
          },
          child: Text('ver resultados', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              color: Colors.blueGrey,
              value: progressIndex / totalQuestions,
              minHeight: 20,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 450),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: quiz.questions.isNotEmpty
                ? Card(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Text(
                            quiz.questions[questionIndex].question,
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue.shade100, width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    )),
                                    leading: Text('${index + 1}'),
                                    title: Text(quiz.questions[questionIndex]
                                        .options[index]),
                                    onTap: () {
                                      _optionSelected(quiz
                                          .questions[questionIndex]
                                          .options[index]);
                                    },
                                  ),
                                );
                              }),
                        )
                      ]))
                : const CircularProgressIndicator(
                    backgroundColor: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            _optionSelected('Skipped');
          },
          child: const Text('escapar'),
        ),
      ]),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class QuizzStartScreen extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (_) => QuizzStartScreen(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<QuizzStartScreen> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(3),
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
    onStop: () {
      print('onStop');
    },
    onEnded: () {
      print('onEnded');
    },
  );

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
    _stopWatchTimer.fetchStop.listen((value) => print('stop from stream'));
    _stopWatchTimer.fetchEnded.listen((value) => print('ended from stream'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountDown Sample'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /// Display stop watch time
                StreamBuilder<int>(
                  stream: _stopWatchTimer.rawTime,
                  initialData: _stopWatchTimer.rawTime.value,
                  builder: (context, snap) {
                    final value = snap.data!;
                    final displayTime =
                        StopWatchTimer.getDisplayTime(value, hours: _isHours);
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            displayTime,
                            style: const TextStyle(
                                fontSize: 40,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            value.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                /// Display every minute.
                StreamBuilder<int>(
                  stream: _stopWatchTimer.minuteTime,
                  initialData: _stopWatchTimer.minuteTime.value,
                  builder: (context, snap) {
                    final value = snap.data;
                    print('Listen every minute. $value');
                    return Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    'minute',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    );
                  },
                ),

                /// Display every second.
                StreamBuilder<int>(
                  stream: _stopWatchTimer.secondTime,
                  initialData: _stopWatchTimer.secondTime.value,
                  builder: (context, snap) {
                    final value = snap.data;
                    print('Listen every second. $value');
                    return Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    'second',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    );
                  },
                ),

                /// Lap time.
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 100,
                    child: StreamBuilder<List<StopWatchRecord>>(
                      stream: _stopWatchTimer.records,
                      initialData: _stopWatchTimer.records.value,
                      builder: (context, snap) {
                        final value = snap.data!;
                        if (value.isEmpty) {
                          return const SizedBox();
                        }
                        Future.delayed(const Duration(milliseconds: 100), () {
                          _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeOut);
                        });
                        print('Listen records. $value');
                        return ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            final data = value[index];
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '${index + 1} ${data.displayTime}',
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                )
                              ],
                            );
                          },
                          itemCount: value.length,
                        );
                      },
                    ),
                  ),
                ),

                /// Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                          },
                          child: const Text(
                            'Start',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          },
                          child: const Text(
                            'Stop',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.reset);
                          },
                          child: const Text(
                            'Reset',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0).copyWith(right: 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
                          },
                          child: const Text(
                            'Lap',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.setPresetHoursTime(1);
                          },
                          child: const Text(
                            'Set Hours',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.setPresetMinuteTime(59);
                          },
                          child: const Text(
                            'Set Minute',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            _stopWatchTimer.setPresetSecondTime(10);
                          },
                          child: const Text(
                            'Set Second',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      onPrimary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      _stopWatchTimer.setPresetTime(mSec: 3599 * 1000);
                    },
                    child: const Text(
                      'Set PresetTime',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      onPrimary: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      _stopWatchTimer.clearPresetTime();
                    },
                    child: const Text(
                      'Clear PresetTime',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
