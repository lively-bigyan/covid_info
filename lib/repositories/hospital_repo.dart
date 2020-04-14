import 'dart:convert';
import 'package:corona_nepal/models/hospitals.dart';
import 'package:corona_nepal/services/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HospitalRepository {
  Future<Hospitals> getHospitals() async {
    try {
      var response = await LocalApi().getData('hospitals');
      var data = response.data;
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setString("hospitals", jsonEncode(data));
      });
      return Hospitals.fromJson(data);
    } catch (error, stacktrace) {
      var data;
      print("Exception occured: $error stackTrace: $stacktrace");
      await SharedPreferences.getInstance().then((prefs) {
        data = json.decode(prefs.getString("hospitals"));
      });
      return Hospitals.fromJson(data);
    }
  }
}
