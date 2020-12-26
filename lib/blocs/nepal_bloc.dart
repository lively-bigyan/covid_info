import 'package:rxdart/rxdart.dart';

import '../models/nepal_stats.dart';
import '../repositories/nepal_stats_repo.dart';

class StatsBloc {
  final StatsRepository _repository = StatsRepository();
  final BehaviorSubject<NepalStats> _subject = BehaviorSubject<NepalStats>();

  getStats() async {
    NepalStats response = await _repository.getStats();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<NepalStats> get subject => _subject;
}
