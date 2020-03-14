import 'package:flutter/material.dart';
import 'package:good_look_app/controllers/clientController.dart';

class ShowClientActivity extends StatefulWidget {
  ClientController controller = new ClientController();
  int clientId = 0;

  getClient() async {
    var client = await controller.getClient(clientId);
    return client;
  }

  ShowClientActivity(int clientId) {
    this.clientId = clientId;
    print('Client ID: $clientId');
  }

  @override
  _ShowClientActivityState createState() => _ShowClientActivityState();
}

class _ShowClientActivityState extends State<ShowClientActivity> {
  var client = {
    "id": 0,
    "name": "",
    'phone': '',
    'email': '',
    'address': '',
    'observations': '',
  };

  showData() async {
    await widget.getClient().then((response) {
      setState(() {
        client = response[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text('Id: ${client["id"]}'),
          Text('Nome: ${client["name"]}'),
          Text('email: ${client["email"]}'),
          Text('phone: ${client["phone"]}'),
          Text('observations: ${client["observations"]}'),
        ],
      ),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cliente'),
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: Text("Editar"),
      icon: Icon(Icons.edit),
    );
  }
}
