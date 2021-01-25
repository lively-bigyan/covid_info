import 'package:dio/dio.dart';

class LocalApi {
  Dio dio = Dio(BaseOptions(
    connectTimeout: 60000,
    receiveTimeout: 60000,
  ));
  final String _url = 'https://nepalcorona.info/api/v1/';
  Future<Response> getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await dio.get(fullUrl,
        options: Options(
          headers: {'Accept': 'application/json'},
        ));
  }

  Future<Response> getDataFromUrl(String apiUrl) async {
    return await dio.get(apiUrl,
        options: Options(headers: {'Accept': 'application/json'}));
  }
}
