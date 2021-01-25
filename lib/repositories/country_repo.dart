import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/countryModel.dart';
import '../services/db_helper.dart';

class CountryRepository {
  Future<AllCountries> getAll() async {
    try {
      var response = await LocalApi().getData('data/world');
      var data = response.data;
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setString('all', jsonEncode(data));
      });
      return AllCountries.fromJson(data);
    } catch (error, stacktrace) {
      var data;
      print('Exception occured: $error stackTrace: $stacktrace');
      await SharedPreferences.getInstance().then((prefs) {
        data = json.decode(prefs.getString('all'));
      });
      return AllCountries.fromJson(data);
    }
  }
}
