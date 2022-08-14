import 'package:apacheers_mobile/pages/home/main_page.dart';
import 'package:apacheers_mobile/pages/pincode_page.dart';
import 'package:apacheers_mobile/pages/report_page.dart';
import 'package:apacheers_mobile/pages/sign_in_page.dart';
import 'package:apacheers_mobile/pages/sign_up_page.dart';
import 'package:apacheers_mobile/pages/splash_page.dart';
import 'package:apacheers_mobile/providers/auth_provider.dart';
import 'package:apacheers_mobile/providers/latest_report_provider.dart';
import 'package:apacheers_mobile/providers/report_history_provider.dart';
import 'package:apacheers_mobile/providers/total_provider.dart';
import 'package:apacheers_mobile/providers/total_thisyear_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LatestReportProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReportHistroyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TotalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TotalThisyearProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/2fa': (context) => PinCode(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/report': (context) => ReportPage(),
        },
      ),
    );
  }
}
