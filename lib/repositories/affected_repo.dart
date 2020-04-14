import 'package:corona_nepal/models/nepalCases.dart';
import 'package:corona_nepal/services/db_helper.dart';

class AffectedRepository {
  Future<AffectedInNepal> getAffected() async {
    try {
      var response = await LocalApi().getData('data/nepal-cases');
      var data = response.data;
      return AffectedInNepal.fromJson(data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return AffectedInNepal.withError(error);
    }
  }
}
