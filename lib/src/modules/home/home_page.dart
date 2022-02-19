import 'package:flutter/material.dart';
import 'package:good_look_app/src/modules/home/widgets/demand_widget.dart';
import 'package:good_look_app/src/modules/home/widgets/home_widget.dart';
import 'package:good_look_app/src/modules/home/widgets/settings_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _page_number = 0;
  TabController controller;

  final List<Widget> _pages = [
    new HomeWidget(),
    new DemandWidget(),
    new SettingsWidget(),
  ];

  @override
  void initState() {
    controller = new TabController(length: _pages.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return TabBarView(controller: controller, children: _pages);
  }

  AppBar header() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text('Good Look'),
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: TabBar(
        controller: controller,
        indicatorWeight: 3,
        indicatorColor: Colors.purpleAccent,
        tabs: <Tab>[
          Tab(
            text: 'Início',
          ),
          Tab(
            text: 'Serviços',
          ),
          Tab(
            text: 'Configurações',
          ),
        ],
      ),
    );
  }
}
