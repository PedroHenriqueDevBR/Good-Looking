import 'package:flutter/material.dart';
import 'package:good_look_app/controllers/UserController.dart';
import 'package:good_look_app/models/User.dart';
import 'package:good_look_app/views/CreateUserActivity.dart';
import 'MainActivity.dart';
import '../dal/SQFLite.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  UserController _controller = new UserController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void createDatabase() {
    var db = SQFLite();
    db.getDatasabe();
  }

  void showMessage(message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  void login() async {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      showMessage('Preencha todos os campos');
    } else {
      var result = await _controller.login(_username.text, _password.text);
      if (result > 0) {
        goToHome();
      } else {
        showMessage('Credenciais inválidas');
      }
    }
  }

  void goToHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeActivity()));
  }

  void goToCreateUser() async {
    final resultId = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => CreateUserActivity()));
    var user = await _controller.getUserById(resultId);
    setState(() {
      _username.text = user[0]['login'];
    });
  }

  @override
  void initState() {
    createDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
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
                        onPressed: () {
                          goToCreateUser();
                        },
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
                        onPressed: () {
                          login();
                        },
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
