// ignore_for_file: deprecated_member_use, unnecessary_this

import 'package:flutter/material.dart';
import '../enrutador/rute.dart';
import '../models/option.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key? key}) : super(key: key);
  //static String id = 'login_page';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.lightBlue);
  late String contVal;
  late String correoVal;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //TODO: implement THIS jeje
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                child: Text(
                  "Learno",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 50.0,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15,
              ),
              _passwordTextField(),
              SizedBox(
                height: 15,
              ),
              _bottonLogin(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'correo electronico',
          ),
          //onChanged: (value) {},
          onSaved: (value) {
            correoVal = value!;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "el campo debe de estar lleno";
            }
          },
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'contrasenia',
              labelText: 'contrasenia',
            ),
            //onChanged: (value) {},
            onSaved: (value) {
              contVal = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "el campo debe de estar lleno";
              }
            },
          ));
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text("iniciar sesion"),
            ),
            style: style,
            onPressed: () {
              _showValidate(context);
            });
      },
    );
  }

  void _showValidate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      Navigator.of(context).pushNamed(MyEnrouter.menuOptions[0].ruta,
          arguments: InitialScreenArguments(
              correo: this.correoVal, cont: this.contVal));
    }
  }
}
