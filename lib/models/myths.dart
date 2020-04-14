class Myths {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;
  String error;
  Myths({this.data, this.total, this.limit, this.start, this.page, this.error});

  Myths.fromJson(Map<String, dynamic> json) {
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
  Myths.withError(String errorVal) {
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
  String type;
  String lang;
  String myth;
  String mythNp;
  String reality;
  String realityNp;
  String imageUrl;
  String sourceName;
  String sourceUrl;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.type,
      this.lang,
      this.myth,
      this.mythNp,
      this.reality,
      this.realityNp,
      this.imageUrl,
      this.sourceName,
      this.sourceUrl,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    lang = json['lang'];
    myth = json['myth'];
    mythNp = json['myth_np'];
    reality = json['reality'];
    realityNp = json['reality_np'];
    imageUrl = json['image_url'];
    sourceName = json['source_name'];
    sourceUrl = json['source_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['lang'] = this.lang;
    data['myth'] = this.myth;
    data['myth_np'] = this.mythNp;
    data['reality'] = this.reality;
    data['reality_np'] = this.realityNp;
    data['image_url'] = this.imageUrl;
    data['source_name'] = this.sourceName;
    data['source_url'] = this.sourceUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
