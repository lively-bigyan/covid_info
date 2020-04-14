import 'dart:convert';
import 'package:corona_nepal/models/faq.dart';
import 'package:corona_nepal/services/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FAQRepository {
  Future<FAQ> getFAQ() async {
    try {
      var response = await LocalApi().getData('faqs');
      var data = response.data;
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setString("faq", jsonEncode(data));
      });
      return FAQ.fromJson(data);
    } catch (error, stacktrace) {
      var data;
      print("Exception occured: $error stackTrace: $stacktrace");
      await SharedPreferences.getInstance().then((prefs) {
        data = json.decode(prefs.getString("faq"));
      });
      return FAQ.fromJson(data);
    }
  }
}
