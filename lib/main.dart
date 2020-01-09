import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool loginState = false;

  @override
  Widget build(BuildContext context) {
    // check pref for login status
    isLogin().then((result) {
      // if login already redirect to
      if (result) {
        setState(() {
          loginState = result;
        });
      }
    });
    return MaterialApp(
      title: 'Dashbard',
      theme: appTheme(),
      // Todo : Enable dark theme
      //darkTheme: ThemeData.dark(),
      home: (loginState == true) ? HomePage() : LoginPage(),
    );
  }
}
