import 'package:flutter/material.dart';
import 'package:good_look_app/models/Client.dart';
import 'package:good_look_app/models/Service.dart';
import 'package:good_look_app/views/CreateClientActivity.dart';
import 'package:good_look_app/views/CreateServiceActivity.dart';
import 'package:good_look_app/views/ShowServiceActivity.dart';


class ListServiceActivity extends StatefulWidget {
  @override
  _ListServiceActivityState createState() => _ListServiceActivityState();
}

class _ListServiceActivityState extends State<ListServiceActivity> {

  List<Service> data = [
    Service('Corte de cabelo Masc', 'Corte de cabelo masculino', 25.0, 5.0),
    Service('Corte de cabelo Fem', 'Corte de cabelo feminino', 40.0, 15.0),
    Service('Maquiagem S', 'Maquiagem simples', 100.0, 30.0),
    Service('Maquiagem C', 'Maquiagem complexo', 150.0, 30.0),
    Service('Manicure', 'Serviços de manicure', 10.0, 5.0),
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
              leading: Icon(Icons.shopping_basket),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(data[index].name),
              subtitle: Text('R\$ ' + data[index].price.toString() + ' ' +data[index].description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowServiceActivity()
                  )
                );
              },
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateServiceActivity()));
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
      title: Text('Serviços'),
    );
  }

  Widget fab() {
    return FloatingActionButton.extended(
      label: Text('Cadastrar'),
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateServiceActivity())
        );
      },
    );
  }
}
