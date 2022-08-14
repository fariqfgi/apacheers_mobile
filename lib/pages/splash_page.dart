import 'dart:async';
import 'package:apacheers_mobile/providers/latest_report_provider.dart';
import 'package:apacheers_mobile/providers/total_provider.dart';
import 'package:apacheers_mobile/providers/total_thisyear_provider.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalName;
String? finalToken;
String? finalIdUser;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _initCheck().whenComplete(() async {
      await Provider.of<LatestReportProvider>(context, listen: false)
          .getLatestReport();
      await Provider.of<TotalProvider>(context, listen: false).getTotal();
      await Provider.of<TotalThisyearProvider>(context, listen: false)
          .getTotalThisyear();

      Timer(
        Duration(seconds: 3),
        () => finalToken == null
            ? Navigator.pushNamed(context, '/sign-in')
            : Navigator.pushNamed(context, '/home'),
      );
      await Firebase.initializeApp();
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
          width: 630,
          height: 750,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/fintrusion_logo2.png'),
            ),
          ),
        ),
      ),
    );
  }
}
