import 'package:rxdart/rxdart.dart';

import '../models/countryModel.dart';
import '../repositories/country_repo.dart';

class CountriesBloc {
  final CountryRepository _repository = CountryRepository();
  final BehaviorSubject<AllCountries> _subject =
      BehaviorSubject<AllCountries>();

  void getCountries() async {
    final response = await _repository.getAll();
    _subject.sink.add(response);
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<AllCountries> get subject => _subject;
}
