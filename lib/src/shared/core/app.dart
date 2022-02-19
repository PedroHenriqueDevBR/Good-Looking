import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_look_app/src/modules/auth/login/login_page.dart';
import 'package:good_look_app/src/shared/core/app_themes.dart';

class AppWidget extends StatelessWidget {
  final _appThemes = AppThemes();

  void changeNavigatorColor() {
    final uiOverlay = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.black,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlay);
  }

  @override
  Widget build(BuildContext context) {
    changeNavigatorColor();
    return MaterialApp(
      title: 'Beati APP',
      debugShowCheckedModeBanner: true,
      theme: _appThemes.lightTheme,
      home: LoginPage(),
    );
  }
}
