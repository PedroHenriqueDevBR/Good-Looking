import 'package:flutter/material.dart';
import 'package:good_look_app/views/DemandFragment.dart';
import 'package:good_look_app/views/HomeFragment.dart';
import 'package:good_look_app/views/SettingsFragment.dart';


class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

  int _page_number = 0;

  final List<Widget> _pages = [
    new HomeFragment('Pagina 01'),
    new DemandFragment(),
    new SettingsFragment(),
  ];

  void _showInfo() {
    print('Botao info precionado');
  }

  void _alterPage(int index) {
    setState(() {
      _page_number = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: _pages[_page_number],
      bottomNavigationBar: bottom_navigation(),
    );
  }

  Widget bottom_navigation() {
    return BottomNavigationBar(
      currentIndex: _page_number,
      onTap: _alterPage,
      selectedFontSize: 13,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.date_range),
          title: Text('Pedidos'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_number),
          title: Text('Mais'),
        ),
      ],
    );
  }

  Widget body() {
    return Center(
      child: Text('Funcionando'),
    );
  }

  AppBar header() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      title: Text('Gerenciamento'),
      actions: <Widget>[
        IconButton(icon:
        Icon(Icons.info_outline),
            onPressed: _showInfo)
      ],
    );
  }
}
