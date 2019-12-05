import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {

  Color _button_color = Colors.pinkAccent;
  EdgeInsets _button_padding = EdgeInsets.symmetric(vertical: 50, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(8),
            color: Colors.pink,
            child: Container(
              padding: _button_padding,
              width: MediaQuery.of(context).size.width,
              child: Center(
                widthFactor: MediaQuery.of(context).size.width,
                child: _text_default('Dashboard'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _card_config_default('Total de Servicos do mes', '15'),
              _card_config_default('Finalizados X Pendetes', '12/15'),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _card_config_default('Pagamentos pendetes', '3'),
              _card_config_default('Ttoal de clientes fidelizados', '23'),
            ],
          ),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            margin: EdgeInsets.all(8),
            color: Colors.pink,
            child: Container(
              padding: _button_padding,
              width: MediaQuery.of(context).size.width,
              child: Center(
                widthFactor: MediaQuery.of(context).size.width,
                child: _text_default('Visao geral'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Card _card_config_default(String info, String data) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
      ),
      color: _button_color,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        padding: _button_padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              info,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              data,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _text_default(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
        shadows: [Shadow(color: Colors.blueGrey[700], offset: Offset(1, 3))],
      ),
    );
  }
}
