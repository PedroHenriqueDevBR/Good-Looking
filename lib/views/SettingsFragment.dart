import 'package:flutter/material.dart';
import 'package:good_look_app/views/ListDemandActivity.dart';

import 'ListClientActivity.dart';
import 'ListServiceActivity.dart';
import 'ListEmployeeActivity.dart';
import 'ListDemandActivity.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    List<ConfigurationItem> data = <ConfigurationItem>[
      ConfigurationItem('Usuários', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListServiceActivity()));
      }, Icons.person_outline),
      ConfigurationItem('Serviços', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListServiceActivity()));
      }, Icons.shopping_basket),
      ConfigurationItem('Clientes', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListClientActivity()));
      }, Icons.people_outline),
      ConfigurationItem('Ajudantes', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListEmlpoyeeActivity()));
      }, Icons.hourglass_empty),
      ConfigurationItem('Pedidos', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListDemandActivity()));
      }, Icons.poll),
    ];

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(data[index].icon),
          title: Text(data[index].title),
          onTap: data[index].action,
        );
      },
    );
  }
}

class ConfigurationItem {
  String title;
  Function action;
  IconData icon;

  ConfigurationItem(title, action, icon) {
    this.title = title;
    this.action = action;
    this.icon = icon;
  }
}
