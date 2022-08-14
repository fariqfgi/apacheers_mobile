import 'package:apacheers_mobile/models/report_model.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';

class ReportDetail extends StatefulWidget {
  final ReportModel report;
  ReportDetail(this.report);

  @override
  State<ReportDetail> createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'REPORT DETAIL',
            style: secondaryTextStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'IP Address',
            style: secondaryTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          Text(
            '${widget.report.ip}',
            style: secondaryTextStyle.copyWith(
              fontSize: 38,
            ),
          ),
          Text(
            'From ${widget.report.country}',
            style: secondaryTextStyle.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 17,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // *HEADER
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'POSSIBLE VULNERABILITIES',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${widget.report.vulnerability}',
                          style: subtitle2TextStyle.copyWith(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // *Date Time
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date Time',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${widget.report.datetime}',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

// *Severity
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Severity',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.report.severity}',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // *Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.report.description}',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // *Request Method
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Request Method',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${widget.report.method}',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // *URL
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'URL',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.report.url}',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            // *Payload
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 50,
              ),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text(
                    'Payload',
                    style: primaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${widget.report.payload}',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
