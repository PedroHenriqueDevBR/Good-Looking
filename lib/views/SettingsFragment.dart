import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {

  Color _button_color = Colors.deepPurpleAccent;
  EdgeInsets _button_padding = EdgeInsets.symmetric(vertical: 50, horizontal: 16);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.all(8),
                color: Colors.lightBlue,
                child: Container(
                  padding: _button_padding,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    widthFactor: MediaQuery.of(context).size.width,
                    child: _text_default('Configuraçoes'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _card_config_default('Clientes', Icons.people),
                  _card_config_default('Serviços', Icons.camera),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _card_config_default('Ajudantes', Icons.person_pin),
                ],
              ),
            ],
          ),
        );
  }


  Card _card_config_default(String text, IconData icon) {
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
          children: <Widget>[
            Icon(
              icon,
              size: 45,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14
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
