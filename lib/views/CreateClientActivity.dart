import 'package:flutter/material.dart';

class CreateClientActivity extends StatefulWidget {
  @override
  _CreateClientActivityState createState() => _CreateClientActivityState();
}

class _CreateClientActivityState extends State<CreateClientActivity> {
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  TextEditingController _txtMail = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();
  TextEditingController _txtObservations = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              style: TextStyle(color: Colors.pink),
            ),
          ],
        ));
  }

  Widget form() {
    return Column(
      children: <Widget>[
        _textFieldDefault('Nome (*)', 'Digite o nome do cliente', _txtName),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('Endereço', 'Endereço do cliente', _txtAddress),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('Contato', 'Melhor contato', _txtPhone),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault('E-Mail', 'E-mail principal', _txtMail),
        SizedBox(
          height: 15,
        ),
        _textFieldDefault(
            'Observaçoes', 'Detalhes sobre o(a) cliente', _txtObservations),
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
            print('Dados salvos com sucesso!.');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  TextField _textFieldDefault(label, hint, controller) {
    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
    );
  }
}
