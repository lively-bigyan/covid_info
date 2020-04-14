
import 'package:corona_nepal/models/nepal_stats.dart';
import 'package:corona_nepal/repositories/nepal_stats_repo.dart';


import 'package:rxdart/rxdart.dart';

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

final statsBloc = StatsBloc();
