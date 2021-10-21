import 'dart:async';

import 'package:cowin_tracker/screens/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cowin_tracker',
      theme: ThemeData.dark(),
      home: Home2(),
      routes: {
        MyHomePage.routeName: (ctx) => MyHomePage(),
      },
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.of(context).pushNamed(MyHomePage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Image.asset(
        "assets/2.png",
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
