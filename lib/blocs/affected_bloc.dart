import 'package:rxdart/rxdart.dart';

import '../models/nepalCases.dart';
import '../repositories/affected_repo.dart';

class AffectedBloc {
  final AffectedRepository _repository = AffectedRepository();
  final BehaviorSubject<AffectedInNepal> _subject =
      BehaviorSubject<AffectedInNepal>();

  getAffected() async {
    AffectedInNepal response = await _repository.getAffected();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AffectedInNepal> get subject => _subject;
}
