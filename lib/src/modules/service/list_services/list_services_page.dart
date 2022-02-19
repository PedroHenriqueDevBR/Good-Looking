import 'package:flutter/material.dart';
import 'package:good_look_app/src/modules/service/create_service/create_service_page.dart';
import 'package:good_look_app/src/shared/models/service_model.dart';
import 'package:good_look_app/src/modules/service/show_service/show_service_page.dart';

class ListServicesPage extends StatefulWidget {
  @override
  _ListServicesPageState createState() => _ListServicesPageState();
}

class _ListServicesPageState extends State<ListServicesPage> {
  List<Service> data = [];

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
              subtitle: Text('R\$ ' +
                  data[index].price.toString() +
                  ' ' +
                  data[index].description),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowServicePage()));
              },
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateServicePage()));
              } else if (direction == DismissDirection.endToStart) {
                setState(() {
                  data.removeAt(index);
                });
              }
            },
          );
        });
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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateServicePage()));
      },
    );
  }
}
