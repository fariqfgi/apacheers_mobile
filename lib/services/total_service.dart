import 'dart:convert';

import 'package:apacheers_mobile/models/total_model.dart';
import 'package:http/http.dart' as http;

class TotalService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<TotalModel> getTotal() async {
    var url = '$baseUrl/report/total';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      TotalModel total = TotalModel.fromJson(jsonDecode(response.body));
      return total;
    } else {
      throw Exception("Failed get total report!");
    }
  }
}
