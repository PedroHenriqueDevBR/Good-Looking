import 'package:flutter/material.dart';


class ShowEmployeeActivity extends StatefulWidget {
  @override
  _ShowEmployeeActivityState createState() => _ShowEmployeeActivityState();
}

class _ShowEmployeeActivityState extends State<ShowEmployeeActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body()
    );
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
