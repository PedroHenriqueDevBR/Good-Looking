import 'package:flutter/material.dart';
import 'package:good_look_app/models/Client.dart';
import 'package:good_look_app/models/Demand.dart';
import 'package:good_look_app/models/Employee.dart';
import 'package:good_look_app/views/CreateClientActivity.dart';
import 'package:good_look_app/views/CreateEmployeeActivity.dart';
import 'package:good_look_app/views/ShowDemandActivity.dart';


class ListDemandActivity extends StatefulWidget {
  @override
  _ListDemandActivityState createState() => _ListDemandActivityState();
}

class _ListDemandActivityState extends State<ListDemandActivity> {

  /*
  *
  String _date_created;
  String _date_service;
  String _hour_service;
  String _client;
  String _employee;
  List<String> _services;
  * */

  List<Demand> data = [
    Demand('06-12-2019', '06-12-2019', '16:00', 'Cliente 01', 'null', ['Corte de cabelo Masc']),
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
              leading: Icon(Icons.person),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(data[index].client),
              subtitle: Text(data[index].date_service + ' as ' + data[index].hour_service + ' horas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowDemandActivity(index)
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
      title: Text('Pedidos'),
    );
  }

  Widget fab() {
    return FloatingActionButton.extended(
      label: Text('Filtrar'),
      icon: Icon(Icons.add),
      onPressed: () {
        print('Filtrar os dados');
//        Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => CreateEmployeeActivity())
//        );
      },
    );
  }
}
