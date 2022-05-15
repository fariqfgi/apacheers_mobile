import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref {
  Future<SharedPreferences> getPrefences() async =>
      await SharedPreferences.getInstance();

  setValue(String key, String value) async {
    (await getPrefences()).setString(key, value);
  }

  Future<String?> getValue(String key) async =>
      (await getPrefences()).getString(key);
}
