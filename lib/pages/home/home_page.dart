import 'package:apacheers_mobile/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/report_total.dart';
import 'package:apacheers_mobile/widget/report_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
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
                    'Hello, $finalName',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '@${finalName?.toLowerCase().split(' ').first}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_image.png'),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget reportTotal() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: ReportTotal(),
      );
    }

    Widget latestReportTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Latest Report',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget latestReport() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: [
            ReportTile(),
            ReportTile(),
            ReportTile(),
            ReportTile(),
            ReportTile(),
            ReportTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        reportTotal(),
        latestReportTitle(),
        latestReport(),
      ],
    );
  }
}
