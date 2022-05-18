import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.lightBlue);
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Text(
                "Learno",
                style: TextStyle(
                  color: Colors.blueAccent,
                  height: 3.0,
                  fontSize: 50.0,
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Text('crear nuevo usuario'),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "usuario",
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "correo electronico",
                              ),
                              onSaved: (String? val) {
                                //bloque de codigo
                              },
                              //bloque que valida el estado de textformfield
                              validator: (String? val) {
                                return (val != null && val.contains('@'))
                                    ? 'debe de contener un @.'
                                    : null;
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "contraseña",
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              style: style,
                              onPressed: () {},
                              child: const Text('crear nuevo usuario'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
              Column(children: [
                Text('o crear nuevo usuario con'),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
