import 'package:flutter/material.dart';
import 'package:good_look_app/models/Employee.dart';


class CreateDemandActivity extends StatefulWidget {
  @override
  _CreateDemandActivityState createState() => _CreateDemandActivityState();
}

class _CreateDemandActivityState extends State<CreateDemandActivity> {

  List<Employee> employees = [];
  List<Employee> services = [];

  TextEditingController _txtDate = TextEditingController();
  TextEditingController _txtHour = TextEditingController();
  TextEditingController _txtClient = TextEditingController();
  TextEditingController _txtEmployees = TextEditingController();
  TextEditingController _txtServices = TextEditingController();


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
              'Cadastrar novo pedido',
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
            Icons.date_range,
            'Data',
            'Data do serviço',
            'Data que o serviço sera executado.',
            _txtDate
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.access_time,
            'Hora',
            'Hora do serviço',
            'Hora que o serviço sera executado.',
            _txtHour
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.person_outline,
            'Cliente',
            'Cliente que vai receber o serviço',
            'Selecione o cliente cadastrado.',
            _txtClient
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.people_outline,
            'Ajudantes',
            'Ajudantes no serviço',
            'Pessoas que ajudarao no serviço.',
            _txtEmployees
        ),

        SizedBox(height: 10,),
        _textFieldDefault(
            Icons.shopping_basket,
            'Serviços',
            'Serviços que serao prestados',
            'Lista de serviços que serçao prestados ao cliente.',
            _txtServices
        ),
      ],
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cadastrar pedido'),
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
