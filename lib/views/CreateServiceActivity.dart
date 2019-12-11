import 'package:flutter/material.dart';


class CreateServiceActivity extends StatefulWidget {
  @override
  _CreateServiceActivityState createState() => _CreateServiceActivityState();
}

class _CreateServiceActivityState extends State<CreateServiceActivity> {

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();
  TextEditingController _txtCostService = TextEditingController();

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
            Icons.shopping_basket,
            'Nome',
            'Nome do servico',
            'Nome unico para o servico cadastrado.',
            _txtName
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.description,
            'Descriçao',
            'Descriçao do servico',
            'Digite uma descricao para o servico.',
            _txtDescription
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.attach_money,
            'Preco',
            'Valor cobrado',
            'O valor que sera cobrado pelo servico.',
            _txtPrice
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.monetization_on,
            'Custos',
            'Custos do servicos',
            'Custos inclusos para realizar o servico.',
            _txtCostService
        ),

      ],
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cadastrar serviço'),
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
