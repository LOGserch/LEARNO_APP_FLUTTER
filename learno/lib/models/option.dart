import '../screens.dart';

class Option {
  String ruta;
  dynamic pantalla;

  Option({required String this.ruta, required dynamic this.pantalla});
}

class InitialScreenArguments {
  String correo;
  String cont;
  InitialScreenArguments({required this.correo, required this.cont});
}
