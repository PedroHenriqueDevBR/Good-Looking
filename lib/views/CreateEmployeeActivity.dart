import 'package:flutter/material.dart';


class CreateEmployeeActivity extends StatefulWidget {
  @override
  _CreateEmployeeActivityState createState() => _CreateEmployeeActivityState();
}

class _CreateEmployeeActivityState extends State<CreateEmployeeActivity> {

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPhone = TextEditingController();
  TextEditingController _txtMail = TextEditingController();
  TextEditingController _txtPercent = TextEditingController();


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
              'Cadastrar novo ajudante',
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
            'Digite o nome do ajudante',
            'Nome que possa distiguir um(a) ajudante de outro(a).',
            _txtName
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.phone_iphone,
            'Contato',
            'Melhor contato',
            'O contato principal do(a) ajudante.',
            _txtPhone
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.mail_outline,
            'E-Mail',
            'E-mail principal',
            'O e-mail principal do(a) ajudante.',
            _txtMail
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.attach_money,
            'Comissao',
            'Commisao do(a) ajudante.',
            'Qual a comissao do(a) ajudante.',
            _txtPercent
        ),
      ],
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cadastrar ajudante'),
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
