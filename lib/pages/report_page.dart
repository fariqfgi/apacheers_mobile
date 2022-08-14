import 'package:apacheers_mobile/providers/report_history_provider.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/report_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  bool loading = false;

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

    Widget screenLoading() {
      return Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 50.0,
        ),
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
      body: loading
          ? screenLoading()
          : Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      cdate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.parse(cdate),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return;
                        setState(() {
                          cdate = DateFormat("yyyy-MM-dd").format(newDate);
                          loading = true;
                        });
                        await Provider.of<ReportHistroyProvider>(context,
                                listen: false)
                            .getReportHistory(date: cdate);
                        setState(() {
                          loading = false;
                        });
                      },
                      child: Text('Select Date'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: content(),
                ),
              ],
            ),
    );
  }
}
