import 'package:apacheers_mobile/models/total_model.dart';
import 'package:apacheers_mobile/services/total_service.dart';
import 'package:flutter/cupertino.dart';

class TotalProvider with ChangeNotifier {
  late TotalModel _total;

  TotalModel get total => _total;

  set total(TotalModel total) {
    _total = total;
    notifyListeners();
  }

  Future<bool> getTotal() async {
    try {
      TotalModel total = await TotalService().getTotal();

      _total = total;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
