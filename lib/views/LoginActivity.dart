import 'package:flutter/material.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                'images/diamond.png',
                alignment: Alignment.center,
                height: 50,
              ),
              Text(
                'Good Look',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              _textViewDefault('Nome de usuário', _username, false),
              _textViewDefault('Senha', _password, false),
              Container(
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Cadastrar'),
                      textColor: Colors.red,
                    ),
                    RaisedButton(
                      color: Colors.purple,
                      textColor: Colors.white,
                      child: Text('Entrar'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.computer,
                  color: Colors.grey[700],
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Desenvolvido por PedroHenriqueDevBR',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _textViewDefault(label, controller, obscure) {
    return Container(
      margin: EdgeInsets.all(4),
      child: TextField(
        obscureText: obscure,
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
