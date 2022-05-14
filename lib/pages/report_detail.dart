import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';

class ReportDetail extends StatelessWidget {
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
            '103.105.35.80',
            style: secondaryTextStyle.copyWith(
              fontSize: 38,
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
                          'xss, lfi, rfi, id, sqli',
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
                    '20/02/2022 08:09',
                    style: tertiaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                    'Detects hash-contained xss payload attacks, setter usage and property overloading',
                    style: subtitleTextStyle.copyWith(
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
                    'GET',
                    style: subtitleTextStyle.copyWith(
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
                    'https://poltektegal.ac.id/sarjana/terapan/teknik/informatika',
                    style: subtitleTextStyle.copyWith(
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
                    '</script>alert(document.cookie)</script>',
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
