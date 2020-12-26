import 'package:rxdart/rxdart.dart';

import '../models/news.dart';
import '../repositories/news_repo.dart';

class NewsBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<News> _subject = BehaviorSubject<News>();

  getNews() async {
    News response = await _repository.getNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<News> get subject => _subject;
}
