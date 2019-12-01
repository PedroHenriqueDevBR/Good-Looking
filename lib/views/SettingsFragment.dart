import 'package:flutter/material.dart';


class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)
                ),
                margin: EdgeInsets.all(8),
                child: Container(
                  child: Text('Configuraçao 01'),
                ),
              )
            ],
          ),
        );
  }
}
