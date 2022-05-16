import 'package:apacheers_mobile/models/report_model.dart';
import 'package:apacheers_mobile/services/latest_report_service.dart';
import 'package:flutter/cupertino.dart';

class LatestReportProvider with ChangeNotifier {
  List<ReportModel> _reports = [];
  List<ReportModel> get reports => _reports;

  set reports(List<ReportModel> reports) {
    _reports = reports;
    notifyListeners();
  }

  Future<void> getLatestReport() async {
    try {
      List<ReportModel> reports = await LatestReportService().getLatestReport();
      _reports = reports;
    } catch (e) {
      print(e);
    }
  }
}
