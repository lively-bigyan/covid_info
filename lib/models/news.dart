class News {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;
  String error;

  News({this.data, this.total, this.limit, this.start, this.page, this.error});
  News.fromJson(Map<String, dynamic> json) {
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
  News.withError(String errorVal) {
    total = 0;
    limit = 0;
    start = 0;
    page = 0;
    data = [];
    error = errorVal;
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
  String lang;
  String url;
  String title;
  String source;
  String summary;
  String imageUrl;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.lang,
      this.url,
      this.title,
      this.source,
      this.summary,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    lang = json['lang'];
    url = json['url'];
    title = json['title'];
    source = json['source'];
    summary = json['summary'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['lang'] = this.lang;
    data['url'] = this.url;
    data['title'] = this.title;
    data['source'] = this.source;
    data['summary'] = this.summary;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
