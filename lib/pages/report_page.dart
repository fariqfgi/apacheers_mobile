import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/report_card.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          ReportCard(),
          ReportCard(),
          ReportCard(),
          ReportCard(),
          ReportCard(),
          ReportCard(),
          ReportCard(),
          ReportCard(),
          ReportCard(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text('Report History'),
        elevation: 0,
      ),
      body: content(),
    );
  }
}
