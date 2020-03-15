import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_look_app/controllers/clientController.dart';
import 'package:good_look_app/models/Client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateClientActivity extends StatefulWidget {
  int clientId;

  CreateClientActivity({this.clientId}) {}

  @override
  _CreateClientActivityState createState() => _CreateClientActivityState();
}

class _CreateClientActivityState extends State<CreateClientActivity> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  ClientController controller = new ClientController();

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  TextEditingController _txtMail = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();
  TextEditingController _txtObservations = TextEditingController();

  String _txtNameError = '';
  String _txtPhoneError = '';
  String _txtMailError = '';
  String _txtAddressError = '';
  String _txtObservationsError = '';

  getLoggedUser() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');
    return id;
  }

  setDataFromClient() async {
    if (widget.clientId != null) {
      await controller.getClient(widget.clientId).then((response) {
        _txtName.text = response[0]['name'];
        _txtPhone.text = response[0]['phone'];
        _txtMail.text = response[0]['email'];
        _txtAddress.text = response[0]['address'];
        _txtObservations.text = response[0]['observations'];
      });
    }
  }

  updateClient() async {
    Client client = new Client();
    bool valid = true;

    String nameError = '';

    if (_txtName.text.isEmpty) {
      nameError = 'Preencha o campo nome';
      valid = false;
    } else {
      client.name = _txtName.text;
    }

    if (_txtPhone.text.isEmpty) {
      client.phone = 'Não cadastrado';
    }

    if (_txtMail.text.isEmpty) {
      client.email = 'Não cadastrado';
    }

    if (_txtAddress.text.isEmpty) {
      client.address = 'Não cadastrado';
    }

    if (_txtObservations.text.isEmpty) {
      client.observations = 'Não cadastrado';
    }

    if (valid) {
      int id = widget.clientId;
      int response = await controller.updateClient(client, id);
      if (response > 0) {
        cleartFields();
        _globalKey.currentState.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Dados atualizados.'),
          ),
        );
        Navigator.pop(context);
      }
    } else {
      setState(() {
        _txtNameError = nameError;
      });
    }
  }

  createClient() async {
    Client client = new Client();
    bool valid = true;

    String nameError = '';

    if (_txtName.text.isEmpty) {
      nameError = 'Preencha o campo nome';
      valid = false;
    } else {
      client.name = _txtName.text;
    }

    if (_txtPhone.text.isEmpty) {
      client.phone = 'Não cadastrado';
    }

    if (_txtMail.text.isEmpty) {
      client.email = 'Não cadastrado';
    }

    if (_txtAddress.text.isEmpty) {
      client.address = 'Não cadastrado';
    }

    if (_txtObservations.text.isEmpty) {
      client.observations = 'Não cadastrado';
    }

    if (valid) {
      int id = await getLoggedUser();
      int response = await controller.newClient(client, id);
      if (response > 0) {
        cleartFields();
        _globalKey.currentState.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Cliente cadastrado.'),
          ),
        );
      }
    } else {
      setState(() {
        _txtNameError = nameError;
      });
    }
  }

  cleartFields() {
    setState(() {
      _txtName.text = '';
      _txtPhone.text = '';
      _txtMail.text = '';
      _txtAddress.text = '';
      _txtObservations.text = '';
    });
  }

  @override
  void initState() {
    setDataFromClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            'Cadastrar novo Cliente',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text('Preencha todos os campo com o asterisco (*)'),
          SizedBox(
            height: 15,
          ),
          form(),
          SizedBox(height: 16),
          Text(
            'Para salvar as alteraçoes clique no botao localizado no '
            'canto superior direito',
            style: TextStyle(color: Colors.deepPurpleAccent),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Column(
      children: <Widget>[
        _textFieldDefault('Nome (*)', 'Digite o nome do cliente', _txtName,
            TextInputType.text, _txtNameError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('Endereço', 'Endereço do cliente', _txtAddress,
            TextInputType.multiline, _txtAddressError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('Contato', 'Melhor contato', _txtPhone,
            TextInputType.phone, _txtPhoneError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('E-Mail', 'E-mail principal', _txtMail,
            TextInputType.emailAddress, _txtMailError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('Observaçoes', 'Detalhes sobre o(a) cliente',
            _txtObservations, TextInputType.multiline, _txtObservationsError),
      ],
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cadastrar cliente'),
      centerTitle: true,
      backgroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.save_alt,
            color: Colors.white,
          ),
          onPressed: () {
            if (widget.clientId == null) {
              createClient();
            } else {
              updateClient();
            }
          },
        ),
      ],
    );
  }

  TextField _textFieldDefault(label, hint, controller, keyboardType, error) {
    if (error == '') {
      error = null;
    }
    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorText: error,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
    );
  }
}
