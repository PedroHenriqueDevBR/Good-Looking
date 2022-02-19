import 'package:flutter/material.dart';
import 'package:good_look_app/src/shared/models/demand_model.dart';
import 'package:good_look_app/src/modules/demand/show_demand/show_demand_page.dart';

class DemandWidget extends StatefulWidget {
  @override
  _DemandWidgetState createState() => _DemandWidgetState();
}

class _DemandWidgetState extends State<DemandWidget> {
  final List<Demand> demands = [
    new Demand('30/11/2019', '02/11/2019', '14:00', 'Pedro Henrique',
        'Jaqueline', ['Corte de cabelo', 'pintura', 'marca lateral', 'barba']),
    new Demand('30/11/2019', '03/11/2019', '14:00', 'Pedro Henrique',
        'Jaqueline', ['Corte de cabelo', 'pintura', 'marca lateral', 'barba']),
    new Demand('30/11/2019', '04/11/2019', '14:00', 'Pedro Henrique',
        'Jaqueline', ['Corte de cabelo', 'pintura', 'marca lateral', 'barba']),
    new Demand('30/11/2019', '05/11/2019', '14:00', 'Pedro Henrique',
        'Jaqueline', ['Corte de cabelo', 'pintura', 'marca lateral', 'barba']),
    new Demand('30/11/2019', '06/11/2019', '14:00', 'Pedro Henrique',
        'Jaqueline', ['Corte de cabelo', 'pintura', 'marca lateral', 'barba']),
    new Demand('30/11/2019', '07/11/2019', '14:00', 'Pedro Henrique',
        'Jaqueline', ['Corte de cabelo', 'pintura', 'marca lateral', 'barba']),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: demands.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.perm_identity),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text(demands[index].client),
            subtitle: Text(demands[index].dateService),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowDemandPage(index)));
            },
          );
        },
      ),
    );
  }
}
