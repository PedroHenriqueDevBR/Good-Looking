import 'package:flutter/material.dart';
import 'package:good_look_app/src/shared/dao/client_dao.dart';

class ShowClientPage extends StatefulWidget {
  ClientDao controller = new ClientDao();
  int clientId = 0;

  getClient() async {
    var client = await controller.getClient(clientId);
    return client;
  }

  ShowClientPage(int clientId) {
    this.clientId = clientId;
  }

  @override
  _ShowClientPageState createState() => _ShowClientPageState();
}

class _ShowClientPageState extends State<ShowClientPage> {
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
      if (this.mounted) {
        setState(() {
          client = response[0];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      // appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height / 3,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              '${client["id"]} - ${client["name"].toString().split(' ')[0]}',
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
            background: Image.asset('images/woman.jpg', fit: BoxFit.cover),
          ),
        ),
        SliverFillRemaining(
          fillOverscroll: true,
          hasScrollBody: false,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('${client["name"]}'),
                  leading: Icon(Icons.person),
                ),
                ListTile(
                  title: Text('${client["email"]}'),
                  leading: Icon(Icons.mail),
                ),
                ListTile(
                  title: Text('${client["phone"]}'),
                  leading: Icon(Icons.phone),
                ),
                ListTile(
                  title: Text('${client["observations"]}'),
                  leading: Icon(Icons.description),
                ),
              ],
            ),
          ),
        )
      ],
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
