import 'package:apacheers_mobile/pages/home/main_page.dart';
import 'package:apacheers_mobile/pages/report_detail.dart';
import 'package:apacheers_mobile/pages/report_page.dart';
import 'package:apacheers_mobile/pages/sign_in_page.dart';
import 'package:apacheers_mobile/pages/sign_up_page.dart';
import 'package:apacheers_mobile/pages/splash_page.dart';
import 'package:apacheers_mobile/providers/auth_provider.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/report': (context) => ReportPage(),
          '/report-detail': (context) => ReportDetail(),
        },
      ),
    );
  }
}
