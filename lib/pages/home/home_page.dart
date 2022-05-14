import 'package:flutter/material.dart';
import 'package:apacheers_mobile/models/user_model.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/report_total.dart';
import 'package:apacheers_mobile/widget/report_tile.dart';
import 'package:apacheers_mobile/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

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
                    'Hello, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '@${user.name?.split(' ').first.toLowerCase()}',
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
