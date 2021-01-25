import 'package:corona_nepal/utils/widgets/handle_errors.dart';

import '../models/nepalCases.dart';
import '../services/db_helper.dart';

class AffectedRepository {
  Future<AffectedInNepal> getAffected() async {
    try {
      var response = await LocalApi()
          .getDataFromUrl('https://data.nepalcorona.info/api/v1/covid');
      var data = response.data;
      print(data);
      return AffectedInNepal.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return AffectedInNepal.withError(handleError(error));
    }
  }
}
