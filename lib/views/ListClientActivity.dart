import 'package:flutter/material.dart';
import 'package:good_look_app/models/Client.dart';
import 'package:good_look_app/views/CreateClientActivity.dart';
import 'package:good_look_app/views/ShowClientActivity.dart';


class ListClientActivity extends StatefulWidget {
  @override
  _ListClientActivityState createState() => _ListClientActivityState();
}

class _ListClientActivityState extends State<ListClientActivity> {

  List<Client> data = [
    Client('Maria', 'Rua das flores', '86978458754', 'maria@gmail.com'),
    Client('Carla', 'Rua das flores', '86978458754', 'maria@gmail.com'),
    Client('Andressa', 'Rua das flores', '86978458754', 'maria@gmail.com'),
    Client('Larissa', 'Rua das flores', '86978458754', 'maria@gmail.com'),
    Client('Thaiane', 'Rua das flores', '86978458754', 'maria@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
      floatingActionButton: fab(),
    );
  }

  Widget body() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: data.length,
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
            leading: Icon(Icons.person_outline),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text(data[index].name),
            subtitle: Text(data[index].phone),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => ShowClientActivity()
                )
              );
            },
          ),
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateClientActivity()));
            } else if (direction == DismissDirection.endToStart) {
              setState(() {
                data.removeAt(index);
              });
            }

          },
        );
      }
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Clientes'),
    );
  }

  Widget fab() {
    return FloatingActionButton.extended(
      label: Text('Cadastrar'),
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateClientActivity())
        );
      },
    );
  }
}
