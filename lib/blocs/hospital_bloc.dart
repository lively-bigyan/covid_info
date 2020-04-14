import 'package:corona_nepal/models/hospitals.dart';
import 'package:corona_nepal/repositories/hospital_repo.dart';
import 'package:rxdart/rxdart.dart';

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

final hospitalsBloc = HospitalsBloc();
