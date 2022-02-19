import 'package:flutter/material.dart';

class ShowEmployeePage extends StatefulWidget {
  @override
  _ShowEmployeePageState createState() => _ShowEmployeePageState();
}

class _ShowEmployeePageState extends State<ShowEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: header(), body: body());
  }

  Widget body() {
    return Center(
      child: Text('Descriçao da ajudante'),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Ajudante'),
    );
  }
}
