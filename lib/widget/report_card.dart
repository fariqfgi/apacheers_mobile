import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 226, 227, 229),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Image.asset(
            'assets/images/password_icon.png',
            height: 70,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Report',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '100000',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
