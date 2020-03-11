import 'package:flutter/material.dart';
import 'package:good_look_app/controllers/clientController.dart';
import 'package:good_look_app/models/Client.dart';

class CreateClientActivity extends StatefulWidget {
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
      int response = await controller.nweClient(client, 1);
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
        ));
    Navigator.pop(context);
  }

  Widget form() {
    return Column(
      children: <Widget>[
        _textFieldDefault(
            'Nome (*)', 'Digite o nome do cliente', _txtName, _txtNameError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault(
            'Endereço', 'Endereço do cliente', _txtAddress, _txtAddressError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault(
            'Contato', 'Melhor contato', _txtPhone, _txtPhoneError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault(
            'E-Mail', 'E-mail principal', _txtMail, _txtMailError),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('Observaçoes', 'Detalhes sobre o(a) cliente',
            _txtObservations, _txtObservationsError),
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
            createClient();
          },
        ),
      ],
    );
  }

  TextField _textFieldDefault(label, hint, controller, error) {
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
