import 'package:flutter/material.dart';
import 'package:good_look_app/src/shared/dao/client_dao.dart';
import 'package:good_look_app/src/modules/client/create_client/create_client_page.dart';
import 'package:good_look_app/src/modules/client/show_client/show_client_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListClientsPage extends StatefulWidget {
  ClientDao controller = new ClientDao();

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
  _ListClientsPageState createState() {
    return _ListClientsPageState();
  }
}

class _ListClientsPageState extends State<ListClientsPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  var clients = [];

  showData() async {
    await widget.getAllClients().then((response) {
      setState(() {
        clients = response;
      });
    });
  }

  showMessage(String msg) {
    _globalKey.currentState.showSnackBar(SnackBar(
      content: Text('$msg'),
      duration: Duration(seconds: 2),
    ));
  }

  createNewClient() async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CreateClientPage())).then(
      (response) {
        showData();
      },
    );
  }

  deleteClient(int clientId, int index) async {
    await widget.controller.deleteClient(clientId).then((response) {
      clients.remove(index);
      showMessage('Cliente deletado');
    });
  }

  updateClient(int clientId, int index) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreateClientPage(
                  clientId: clientId,
                ))).then(
      (response) {
        print('Passou por aqui');
        showData();
      },
    );
  }

  @override
  initState() {
    showData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
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
            key: UniqueKey(),
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
                        builder: (context) =>
                            ShowClientPage(clients[index]['id'])));
              },
            ),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) async {
              if (direction == DismissDirection.endToStart) {
                deleteClient(clients[index]['id'], index);
              } else if (direction == DismissDirection.startToEnd) {
                updateClient(clients[index]['id'], index);
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
        createNewClient();
      },
    );
  }
}
