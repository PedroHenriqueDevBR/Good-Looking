import 'package:flutter/material.dart';


class CreateClientActivity extends StatefulWidget {
  @override
  _CreateClientActivityState createState() => _CreateClientActivityState();
}

class _CreateClientActivityState extends State<CreateClientActivity> {

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtAddress = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  TextEditingController _txtMail = TextEditingController();
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
              style: TextStyle(
                fontSize: 16
              ),
            ),
            Text('Preencha todos os campo com o asterisco (*)'),
            SizedBox(height: 15,),
            form(),
            SizedBox(height: 16),
            Text(
                'Para salvar as alteraçoes clique no botao localizado no '
                'canto superior direito',
              style: TextStyle(
                color: Colors.pink
              ),
            ),
          ],
        )
    );
  }

  Widget form() {
    return Column(
      children: <Widget>[
        _textFieldDefault(
            Icons.person_outline,
            'Nome',
            'Digite o nome do cliente',
            'Um nome que possa distiguir um(a) cliente de outro(a) pode ser interessante.',
            _txtName
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.home,
            'Endereço',
            'Endereço do cliente',
            'O endereço da cliente.',
            _txtAddress
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.phone_iphone,
            'Contato',
            'Melhor contato',
            'O contato principal do(a) cliente pode facilitar muito na hora de entrar em contato.',
            _txtPhone
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.mail_outline,
            'E-Mail',
            'E-mail principal',
            'O e-mail principal do(a) cliente pode facilitar na hora de passar uma informaçao.',
            _txtMail
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.mail_outline,
            'Observaçoes',
            'Detalhes sobre o(a) cliente',
            'Descreva algo que o(a) cliente tenha preferencia, como marca de '
                'produto por exemplo.',
            _txtObservations
        ),
      ],
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cadastrar cliente'),
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

  TextField _textFieldDefault(icon, label, hint, helper, controller) {
    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          icon: Icon(icon),
          helperText: helper,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )
      ),
    );
  }
}
