import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:good_look_app/views/DemandFragment.dart';
import 'package:good_look_app/views/HomeFragment.dart';
import 'package:good_look_app/views/SettingsFragment.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
    with SingleTickerProviderStateMixin {
  int _page_number = 0;
  TabController controller;

  final List<Widget> _pages = [
    new HomeFragment(),
    new DemandFragment(),
    new SettingsFragment(),
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
