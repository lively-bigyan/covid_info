import 'package:corona_nepal/models/faq.dart';
import 'package:corona_nepal/repositories/faq_repo.dart';

import 'package:rxdart/rxdart.dart';

class FAQBloc {
  final FAQRepository _repository = FAQRepository();
  final BehaviorSubject<FAQ> _subject = BehaviorSubject<FAQ>();

  getFAQ() async {
    FAQ response = await _repository.getFAQ();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<FAQ> get subject => _subject;
}

final faqBloc = FAQBloc();
