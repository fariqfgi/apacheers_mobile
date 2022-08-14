import 'package:apacheers_mobile/models/total_thisyear_model.dart';
import 'package:apacheers_mobile/services/total_service.dart';
import 'package:flutter/foundation.dart';

class TotalThisyearProvider with ChangeNotifier {
  List<TotalThisyearModel> _data = [];
  List<TotalThisyearModel> get data => _data;

  set data(List<TotalThisyearModel> data) {
    _data = data;
    notifyListeners();
  }

  Future<void> getTotalThisyear() async {
    try {
      List<TotalThisyearModel> data = await TotalService().getTotalThisyear();
      _data = data;
    } catch (e) {
      print(e);
    }
  }
}
