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
  Myths.withError(String errorVal) {
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
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['lang'] = lang;
    data['myth'] = myth;
    data['myth_np'] = mythNp;
    data['reality'] = reality;
    data['reality_np'] = realityNp;
    data['image_url'] = imageUrl;
    data['source_name'] = sourceName;
    data['source_url'] = sourceUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
