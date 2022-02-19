import 'package:flutter/material.dart';
import 'package:good_look_app/src/modules/demand/list_demands/list_demands_page.dart';
import 'package:good_look_app/src/modules/service/list_services/list_services_page.dart';

import '../../client/list_clients/list_clients_page.dart';
import '../../employee/list_Employees/list_employees_page.dart';
import '../../demand/list_demands/list_demands_page.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    List<ConfigurationItem> data = <ConfigurationItem>[
      ConfigurationItem('Usuários', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListServicesPage()));
      }, Icons.person_outline),
      ConfigurationItem('Serviços', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListServicesPage()));
      }, Icons.shopping_basket),
      ConfigurationItem('Clientes', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListClientsPage()));
      }, Icons.people_outline),
      ConfigurationItem('Ajudantes', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListEmlpoyeePage()));
      }, Icons.hourglass_empty),
      ConfigurationItem('Pedidos', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListDemandsPage()));
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
