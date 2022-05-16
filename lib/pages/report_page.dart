import 'package:apacheers_mobile/providers/report_history_provider.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/report_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ReportHistroyProvider reportHistroyProvider =
        Provider.of<ReportHistroyProvider>(context);
    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: reportHistroyProvider.reports
            .map(
              (report) => ReportCard(report),
            )
            .toList(),
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
