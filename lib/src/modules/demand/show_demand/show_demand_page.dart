import 'package:flutter/material.dart';

class ShowDemandPage extends StatefulWidget {
  int _id;

  ShowDemandPage(int id) {
    this._id = id;
  }

  @override
  _ShowDemandPageState createState() => _ShowDemandPageState();
}

class _ShowDemandPageState extends State<ShowDemandPage> {
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
