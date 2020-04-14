import 'package:dio/dio.dart';

class LocalApi {
  Dio dio = Dio();
  final String _url = "https://nepalcorona.info/api/v1/";
  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await dio.get(fullUrl,
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
  }
}
