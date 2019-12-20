import 'package:flutter/material.dart';


class ShowDemandActivity extends StatefulWidget {
  int _id;

  ShowDemandActivity(int id) {
    this._id = id;
  }

  @override
  _ShowDemandActivityState createState() => _ShowDemandActivityState();
}

class _ShowDemandActivityState extends State<ShowDemandActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      child: Center(
        child: Text('Dados do pedido'),
      ),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Pedido ' + widget._id.toString()),
      leading: Icon(Icons.person),
    );
  }

}
