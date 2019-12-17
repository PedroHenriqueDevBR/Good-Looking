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
      ConfigurationItem('Serviços', 'Serviços cadastrados', () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  ListServiceActivity())
        );
      }, Icons.shopping_basket),

      ConfigurationItem('Clientes', 'Acessar os dados de todos os clientes', (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListClientActivity())
        );
      }, Icons.people_outline),

      ConfigurationItem('Ajudantes', 'Ajudantes nos serviços', () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListEmlpoyeeActivity())
        );
      }, Icons.hourglass_empty),

      ConfigurationItem('Pedidos', 'Pedidos atendidos', () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListDemandActivity())
        );
      }, Icons.poll),
    ];

    return ListView.builder(
      itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(data[index].icon),
            title: Text(data[index].title),
            subtitle: Text(data[index].subtitle),
            onTap: data[index].action,
          );
        },

    );
  }

}

class ConfigurationItem {
  String title;
  String subtitle;
  Function action;
  IconData icon;

  ConfigurationItem(title, subtitle, action, icon) {
    this.title = title;
    this.subtitle = subtitle;
    this.action = action;
    this.icon = icon;
  }
}