import 'package:rxdart/rxdart.dart';

import '../models/hospitals.dart';
import '../repositories/hospital_repo.dart';

class HospitalsBloc {
  final HospitalRepository _repository = HospitalRepository();
  final BehaviorSubject<Hospitals> _subject = BehaviorSubject<Hospitals>();

  void getHospitals() async {
    final response = await _repository.getHospitals();
    _subject.sink.add(response);
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<Hospitals> get subject => _subject;
}
