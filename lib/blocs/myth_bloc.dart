
import 'package:corona_nepal/models/myths.dart';
import 'package:corona_nepal/repositories/myths_repo.dart';

import 'package:rxdart/rxdart.dart';

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

final mythBloc = MythBloc();
