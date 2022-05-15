import 'dart:async';
import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalName;
String? finalToken;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _initCheck().whenComplete(() async {
      Timer(
        Duration(seconds: 3),
        () => finalToken == null
            ? Navigator.pushNamed(context, '/sign-in')
            : Navigator.pushNamed(context, '/home'),
      );
    });

    super.initState();
  }

  Future _initCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    finalToken = prefs.getString('token');
    finalName = prefs.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 230,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
