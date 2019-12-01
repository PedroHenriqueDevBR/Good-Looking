import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  String _title;

  HomeFragment(String title) {
    this._title = title;
  }

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget._title),
    );
  }
}
