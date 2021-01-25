import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/nepal_stats.dart';
import '../services/db_helper.dart';

class StatsRepository {
  Future<NepalStats> getStats() async {
    try {
      var response = await LocalApi().getData('data/nepal');
      var data = response.data;
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setString('nepal', jsonEncode(data));
      });
      return NepalStats.fromJson(data);
    } catch (error, stacktrace) {
      var data;
      print('Exception occured: $error stackTrace: $stacktrace');
      await SharedPreferences.getInstance().then((prefs) {
        data = json.decode(prefs.getString('nepal'));
      });
      return NepalStats.fromJson(data);
    }
  }
}
