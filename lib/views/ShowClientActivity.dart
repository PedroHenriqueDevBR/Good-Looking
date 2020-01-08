import 'package:flutter/material.dart';


class ShowClientActivity extends StatefulWidget {
  @override
  _ShowClientActivityState createState() => _ShowClientActivityState();
}

class _ShowClientActivityState extends State<ShowClientActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return Center(
      child: Text('Detalhes do cliente'),
    );
  }

  AppBar header() {
    return AppBar(
      title: Text('Cliente'),
    );
  }

}
