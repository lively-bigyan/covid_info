import 'package:corona_nepal/models/nepalCases.dart';
import 'package:corona_nepal/repositories/affected_repo.dart';
import 'package:rxdart/rxdart.dart';

class AffectedBloc {
  final AffectedRepository _repository = AffectedRepository();
  final BehaviorSubject<AffectedInNepal> _subject = BehaviorSubject<AffectedInNepal>();

  getAffected() async {
    AffectedInNepal response = await _repository.getAffected();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<AffectedInNepal> get subject => _subject;
}

final affectedBloc = AffectedBloc();
