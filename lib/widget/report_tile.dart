import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xff252836),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(
                Icons.warning,
                size: 40,
                color: Colors.red,
              ),
              title: Text(
                'IP 180.199.92.92',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'Detect xss, lfi, rfi',
                style: TextStyle(
                  color: Color(0xff504F5E),
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
                  '20/03/2022 09:09',
                  style: TextStyle(
                    color: subtitleColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
