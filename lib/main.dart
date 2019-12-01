import 'package:flutter/material.dart';
import 'package:good_look_app/views/MainActivity.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gerenciamento de OS',
    debugShowCheckedModeBanner: true,
    theme: ThemeData(
      primarySwatch: Colors.purple
    ),
    home: HomeActivity(),
  ));
}