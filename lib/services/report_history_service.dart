import 'dart:convert';
import 'package:apacheers_mobile/models/report_model.dart';
import 'package:http/http.dart' as http;

class ReportHistoryService {
  // String baseUrl = 'http://143.198.192.252/api';
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ReportModel>> getReportHistory({
    required String date,
  }) async {
    var url = '$baseUrl/report?date=$date';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);

    // print(response.statusCode);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ReportModel> reports = [];

      for (var item in data) {
        reports.add(ReportModel.fromJson(item));
      }
      return reports;
    } else {
      throw Exception('Failed get report!');
    }
  }
}
