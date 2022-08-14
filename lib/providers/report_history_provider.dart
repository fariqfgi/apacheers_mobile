import 'package:apacheers_mobile/models/report_model.dart';
import 'package:apacheers_mobile/services/report_history_service.dart';
import 'package:flutter/cupertino.dart';

class ReportHistroyProvider with ChangeNotifier {
  List<ReportModel> _reports = [];
  List<ReportModel> get reports => _reports;

  set reports(List<ReportModel> reports) {
    _reports = reports;
    notifyListeners();
  }

  Future<void> getReportHistory({
    required String date,
  }) async {
    try {
      List<ReportModel> reports =
          await ReportHistoryService().getReportHistory(date: date);
      _reports = reports;
    } catch (e) {
      print(e);
    }
  }
}
