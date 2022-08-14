import 'package:apacheers_mobile/models/total_model.dart';
import 'package:apacheers_mobile/pages/splash_page.dart';
import 'package:apacheers_mobile/providers/latest_report_provider.dart';
import 'package:apacheers_mobile/providers/report_history_provider.dart';
import 'package:apacheers_mobile/providers/total_provider.dart';
import 'package:apacheers_mobile/providers/total_thisyear_provider.dart';
import 'package:flutter/material.dart';
import 'package:apacheers_mobile/theme.dart';
import 'package:apacheers_mobile/widget/report_tile.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<ChartData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  final List<ChartData> chartData = [];
  late TotalThisyearProvider totalThisyear;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    getInit();
    super.initState();
  }

  getInit() async {
    String cdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    await Provider.of<ReportHistroyProvider>(context, listen: false)
        .getReportHistory(date: cdate);
  }

  @override
  Widget build(BuildContext context) {
    TotalProvider totalProvider = Provider.of<TotalProvider>(context);
    TotalModel total = totalProvider.total;
    LatestReportProvider latestReportProvider =
        Provider.of<LatestReportProvider>(context);
    TotalThisyearProvider totalThisyearProvider =
        Provider.of<TotalThisyearProvider>(context);

    if (chartData.isEmpty) {
      totalThisyearProvider.data
          .map((e) => chartData.add(ChartData(e.month, e.total_report)))
          .toList();
    }

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
        height: 110,
        margin: EdgeInsets.only(
          top: 40.0,
          right: 20.0,
          left: 20.0,
          bottom: 30.0,
        ),
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
                      total.total.toString(),
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

    Widget chartTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Report Statistic in This Year',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget chartContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
          bottom: 14,
        ),
        child: SfCircularChart(
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.scroll,
            position: LegendPosition.right,
            textStyle: primaryTextStyle,
          ),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.month,
              yValueMapper: (ChartData data, _) => data.item,
              enableTooltip: true,
            ),
          ],
        ),
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
          children: latestReportProvider.reports
              .map(
                (report) => ReportTile(report),
              )
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        reportTotal(),
        chartTitle(),
        chartContent(),
        latestReportTitle(),
        latestReport(),
      ],
    );
  }
}

class ChartData {
  ChartData(this.month, this.item);
  final String? month;
  final int? item;
}
