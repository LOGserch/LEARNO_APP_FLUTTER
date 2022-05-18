//rutas configuradas para las vistas que se van a utilizar
import 'package:flutter/material.dart';
import 'package:learno/models/option.dart';
import '../classes/quiz.dart';
import '../screens.dart';

class MyEnrouter {
  Quiz quiz = Quiz(name: 'Quiz de cap', questions: []);
  static final menuOptions = <Option>[
    Option(
      ruta: 'ruta1',
      pantalla: LoginScreen(),
    ),
    Option(
      ruta: 'ruta2',
      pantalla: RegisterScreen(),
    ),
    Option(
      ruta: 'ruta3',
      pantalla: CreateQuizzScreen(),
    ),
    Option(
      ruta: 'ruta4',
      pantalla: ConfMatScreen(),
    ),
    Option(
      ruta: 'ruta5',
      pantalla: MateriaScreen(),
    ),
    Option(
      ruta: 'ruta6',
      pantalla: SessionScreen(),
    ),
    Option(
      ruta: 'ruta7',
      pantalla: QuizzScreen(),
    ),
    Option(
      ruta: 'ruta8',
      pantalla: QuizzStartScreen(),
    ),
  ];
  static String rutaInicial = 'rutaInicial';

  static Map<String, Widget Function(BuildContext)> rutas = {
    'ruta1': (context) => const InicialScreen(),
    'ruta2': (context) => const RegisterScreen(),
    'ruta3': (context) => CreateQuizzScreen(),
    'ruta4': (context) => const ConfMatScreen(),
    'ruta5': (context) => const MateriaScreen(),
    'ruta6': (context) => const SessionScreen(),
    'ruta7': (context) => const QuizzScreen(),
    'ruta8': (context) => QuizzStartScreen(), //LoginScreen()
    'rutaInicial': (context) => LoginScreen() //InicialScreen(),
  };
}
