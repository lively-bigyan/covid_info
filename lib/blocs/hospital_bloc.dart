import 'package:rxdart/rxdart.dart';

import '../models/hospitals.dart';
import '../repositories/hospital_repo.dart';

class HospitalsBloc {
  final HospitalRepository _repository = HospitalRepository();
  final BehaviorSubject<Hospitals> _subject = BehaviorSubject<Hospitals>();

  getHospitals() async {
    Hospitals response = await _repository.getHospitals();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<Hospitals> get subject => _subject;
}
