/*
//esto va afuera de widget build:
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.lightBlue);
  //key para validar el form
  final _formKey = GlobalKey<FormState>();
  final String labelText;

  const _LoginScreenState({this.labelText});
 
 
 
 
 Scaffold(
        body: Center(
            child: Column(children: [
          Text(
            "Learno",
            style: TextStyle(
              color: Colors.blueAccent,
              height: 5.0,
              fontSize: 50.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "usuario",
                    ),
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
                      validator: (String? value) {}),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate devolverá true si el formulario es válido, o false si
                      // el formulario no es válido.
                      if (_formKey.currentState!.validate()) {
                        // Si el formulario es válido, muestre un snackbar. En el mundo real, a menudo
                        // desea llamar a un servidor o guardar la información en una base de datos
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    },
                    child: Text('iniciar sesio'),
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
                            child: const Text('crear cuenta'),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {},
                            child: const Text('olvido la contraseña?'),
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
      **/