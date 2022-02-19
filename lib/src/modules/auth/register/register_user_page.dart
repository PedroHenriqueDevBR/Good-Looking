import 'package:flutter/material.dart';
import 'package:good_look_app/src/shared/dao/User_dao.dart';
import 'package:good_look_app/src/shared/models/user_model.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _nameControler = TextEditingController();
  TextEditingController _loginControler = TextEditingController();
  TextEditingController _passControler = TextEditingController();
  TextEditingController _repeatePassControler = TextEditingController();

  String _alertName = '';
  String _alertLogin = '';
  String _alertPass = '';
  String _alertRepeatePass = '';

  UserDao controller = new UserDao();

  void showMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }

  verifyFields() async {
    String name;
    String login;
    String pass;
    String repeatePass;
    bool valid = true;

    if (_nameControler.text.isEmpty) {
      name = 'Campo obrigatório';
      valid = false;
    } else {
      name = '';
    }

    if (_loginControler.text.isEmpty) {
      login = 'Campo obrigatório';
      valid = false;
    } else {
      login = '';
    }

    if (_passControler.text.isEmpty) {
      pass = 'Campo obrigatório';
      valid = false;
    } else {
      pass = '';
    }

    if (_repeatePassControler.text != _passControler.text) {
      repeatePass = 'As senhas não conferem';
      valid = false;
    } else {
      if (_repeatePassControler.text.isEmpty) {
        repeatePass = 'Campo obrigatório';
        valid = false;
      } else {
        repeatePass = '';
      }
    }

    if (valid) {
      await createUser();
    } else {
      setState(() {
        _alertName = name;
        _alertLogin = login;
        _alertPass = pass;
        _alertRepeatePass = repeatePass;
      });
    }
  }

  createUser() async {
    if (await controller.usernameRegistered(_loginControler.text)) {
      showMessage('Login já registrado, digite outro login.');
    } else {
      User user = new User();
      user.name = _nameControler.text;
      user.login = _loginControler.text;
      user.password = _passControler.text;
      var response = await controller.createUser(user);
      showMessage('usuário cadastrado, efetue o login!');
      Navigator.pop(context, response);
    }
  }

  void leave() {
    Navigator.pop(context, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width,
              color: Colors.purple,
            ),
            formCreateUser(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    leave();
                  },
                ),
                RaisedButton(
                  child: Text('Cadastrar'),
                  color: Colors.purple,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  )),
                  onPressed: () {
                    verifyFields();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: Text('Good Look'),
      centerTitle: true,
      backgroundColor: Colors.black,
      automaticallyImplyLeading: false,
    );
  }

  Widget myBody() {
    return Container();
  }

  Widget formCreateUser() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          _inputDefault('Nome completo', _nameControler, false, _alertName),
          SizedBox(height: 16),
          _inputDefault('Login', _loginControler, false, _alertLogin),
          SizedBox(height: 16),
          _inputDefault('Senha', _passControler, true, _alertPass),
          SizedBox(height: 16),
          _inputDefault('repetir a senha', _repeatePassControler, true,
              _alertRepeatePass),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  TextField _inputDefault(label, controller, obscure, error) {
    if (error.isEmpty) {
      error = null;
    }
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        errorText: error,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}
