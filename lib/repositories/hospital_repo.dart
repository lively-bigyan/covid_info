import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/hospitals.dart';
import '../services/db_helper.dart';

class HospitalRepository {
  Future<Hospitals> getHospitals() async {
    try {
      var response = await LocalApi().getData('hospitals');
      var data = response.data;
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setString('hospitals', jsonEncode(data));
      });
      return Hospitals.fromJson(data);
    } catch (error, stacktrace) {
      var data;
      print('Exception occured: $error stackTrace: $stacktrace');
      await SharedPreferences.getInstance().then((prefs) {
        data = json.decode(prefs.getString('hospitals'));
      });
      return Hospitals.fromJson(data);
    }
  }
}
