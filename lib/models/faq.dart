class FAQ {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;
  String error;

  FAQ({this.data, this.total, this.limit, this.start, this.page, this.error});

  FAQ.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    start = json['start'];
    page = json['page'];
  }
  FAQ.withError(String errorVal) {
    data = [];
    error = errorVal;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['limit'] = limit;
    data['start'] = start;
    data['page'] = page;
    return data;
  }
}

class Data {
  String sId;
  String type;
  String lang;
  String question;
  String questionNp;
  String answer;
  String answerNp;
  String category;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.type,
      this.lang,
      this.question,
      this.questionNp,
      this.answer,
      this.answerNp,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    lang = json['lang'];
    question = json['question'];
    questionNp = json['question_np'];
    answer = json['answer'];
    answerNp = json['answer_np'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['lang'] = lang;
    data['question'] = question;
    data['question_np'] = questionNp;
    data['answer'] = answer;
    data['answer_np'] = answerNp;
    data['category'] = category;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
