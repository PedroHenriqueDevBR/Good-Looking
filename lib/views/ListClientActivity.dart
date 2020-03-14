import 'package:flutter/material.dart';
import 'package:good_look_app/controllers/clientController.dart';
import 'package:good_look_app/views/CreateClientActivity.dart';
import 'package:good_look_app/views/ShowClientActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListClientActivity extends StatefulWidget {
  ClientController controller = new ClientController();

  getLoggedUser() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');
    return id;
  }

  getAllClients() async {
    int id = await getLoggedUser();
    var response = controller.getAllClients(id);
    return response;
  }

  @override
  _ListClientActivityState createState() {
    getAllClients();
    return _ListClientActivityState();
  }
}

class _ListClientActivityState extends State<ListClientActivity> {
  var clients = [];

  showData() async {
    await widget.getAllClients().then((response) {
      setState(() {
        clients = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: header(),
      body: body(),
      floatingActionButton: fab(),
    );
  }

  Widget body() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            background: Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.all(16),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            child: ListTile(
              leading: Icon(Icons.people_outline),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(clients[index]['name']),
              subtitle: Text(clients[index]['phone']),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowClientActivity()));
              },
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateClientActivity()));
              } else if (direction == DismissDirection.endToStart) {
                setState(() {
                  // clients.removeAt(index);
                  print('Deletado.');
                });
              }
            },
          );
        });
  }

  AppBar header() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text('Clientes'),
      backgroundColor: Colors.black,
    );
  }

  Widget fab() {
    return FloatingActionButton.extended(
      backgroundColor: Colors.purple,
      label: Text('Cadastrar'),
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateClientActivity()));
      },
    );
  }
}
