import 'package:apacheers_mobile/theme.dart';
import 'package:flutter/material.dart';

class ReportTotal extends StatelessWidget {
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
            width: 50,
          ),
          Image.asset(
            'assets/images/report_icon.png',
            height: 70,
          ),
          SizedBox(
            width: 5,
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
                    '1000',
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
