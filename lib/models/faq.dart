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
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    start = json['start'];
    page = json['page'];
  }
  FAQ.withError(String errorVal){
    data=[];
    error=errorVal;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['start'] = this.start;
    data['page'] = this.page;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['lang'] = this.lang;
    data['question'] = this.question;
    data['question_np'] = this.questionNp;
    data['answer'] = this.answer;
    data['answer_np'] = this.answerNp;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}