import 'package:corona_nepal/utils/widgets/handle_errors.dart';

import '../models/news.dart';
import '../services/db_helper.dart';

class NewsRepository {
  Future<News> getNews() async {
    try {
      var response = await LocalApi().getData('news');
      var data = response.data;
      return News.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return News.withError(handleError(error));
    }
  }
}
