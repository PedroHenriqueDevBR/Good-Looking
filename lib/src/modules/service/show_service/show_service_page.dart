import 'package:flutter/material.dart';

class ShowServicePage extends StatefulWidget {
  @override
  _ShowServicePageState createState() => _ShowServicePageState();
}

class _ShowServicePageState extends State<ShowServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return Center(
      child: Text('Descriçao do serviço'),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Serviço'),
    );
  }
}
