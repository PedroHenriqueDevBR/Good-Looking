import 'package:flutter/material.dart';
import 'package:good_look_app/models/Client.dart';
import 'package:good_look_app/models/Employee.dart';
import 'package:good_look_app/views/CreateClientActivity.dart';
import 'package:good_look_app/views/CreateEmployeeActivity.dart';
import 'package:good_look_app/views/ShowEmployeeActivity.dart';


class ListEmlpoyeeActivity extends StatefulWidget {
  @override
  _ListEmlpoyeeActivityState createState() => _ListEmlpoyeeActivityState();
}

class _ListEmlpoyeeActivityState extends State<ListEmlpoyeeActivity> {

  List<Employee> data = [
    Employee('Ajudante 01', '86978458754', 'maria@gmail.com', 15.0),
    Employee('Ajudante 02', '86654985221', 'maria@gmail.com', 5.0),
    Employee('Ajudante 03', '86987453167', 'maria@gmail.com', 10.0),
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
              title: Text(data[index].name),
              subtitle: Text(data[index].phone),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => ShowEmployeeActivity()
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
      title: Text('Ajudantes'),
    );
  }

  Widget fab() {
    return FloatingActionButton.extended(
      label: Text('Cadastrar'),
      icon: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateEmployeeActivity())
        );
      },
    );
  }
}
