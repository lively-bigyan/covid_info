import 'package:rxdart/rxdart.dart';

import '../models/myths.dart';
import '../repositories/myths_repo.dart';

class MythBloc {
  final MythRepository _repository = MythRepository();
  final BehaviorSubject<Myths> _subject = BehaviorSubject<Myths>();

  getMyth() async {
    Myths response = await _repository.getMyths();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<Myths> get subject => _subject;
}
