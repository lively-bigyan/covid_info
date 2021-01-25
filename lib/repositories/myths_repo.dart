import 'package:corona_nepal/utils/widgets/handle_errors.dart';

import '../models/myths.dart';
import '../services/db_helper.dart';

class MythRepository {
  Future<Myths> getMyths() async {
    try {
      var response = await LocalApi().getData('myths');
      var data = response.data;
      return Myths.fromJson(data);
    } catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      return Myths.withError(handleError(error));
    }
  }
}
