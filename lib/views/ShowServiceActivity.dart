import 'package:flutter/material.dart';


class ShowServiceActivity extends StatefulWidget {
  @override
  _ShowServiceActivityState createState() => _ShowServiceActivityState();
}

class _ShowServiceActivityState extends State<ShowServiceActivity> {
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
