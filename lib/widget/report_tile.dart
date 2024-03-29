import 'package:apacheers_mobile/models/report_model.dart';
import 'package:apacheers_mobile/pages/report_detail.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  final ReportModel report;
  ReportTile(this.report);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportDetail(report),
          ),
        );
      },
      child: Container(
        child: Card(
          margin: EdgeInsets.only(
            right: 20,
            left: 20,
            bottom: 10,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: Color(0xff252836),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.warning,
                  size: 40,
                  color: Color(0xffED6363),
                ),
                title: Text(
                  'IP ${report.ip}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Detect ${report.vulnerability}',
                  style: TextStyle(
                    color: Color(0xff999999),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 30,
                    bottom: 5,
                  ),
                  child: Text(
                    '${report.datetime}',
                    style: TextStyle(
                      color: tertiaryTextColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
