class AffectedInNepal {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;
  String error;

  AffectedInNepal(
      {this.data, this.total, this.limit, this.start, this.page, this.error});

  AffectedInNepal.fromJson(Map<String, dynamic> json) {
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
  AffectedInNepal.withError(String errorVal) {
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
  int id;
  int province;
  int district;
  int municipality;
  String createdOn;
  String modifiedOn;
  String label;
  String gender;
  int age;
  Point point;
  Null occupation;
  String reportedOn;
  String currentState;
  String source;
  String comment;
  int nationality;
  int ward;
  Data(
      {this.id,
      this.province,
      this.district,
      this.municipality,
      this.createdOn,
      this.modifiedOn,
      this.label,
      this.gender,
      this.age,
      this.point,
      this.occupation,
      this.reportedOn,
      this.currentState,
      this.source,
      this.comment,
      this.nationality,
      this.ward});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    province = json['province'];
    district = json['district'];
    municipality = json['municipality'];
    createdOn = json['createdOn'];
    modifiedOn = json['modifiedOn'];
    label = json['label'];
    gender = json['gender'];
    age = json['age'];
    point = json['point'] != null ? new Point.fromJson(json['point']) : null;
    occupation = json['occupation'];
    reportedOn = json['reportedOn'];
    currentState = json['currentState'];
    source = json['source'];
    comment = json['comment'];
    nationality = json['nationality'];
    ward = json['ward'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['province'] = this.province;
    data['district'] = this.district;
    data['municipality'] = this.municipality;
    data['createdOn'] = this.createdOn;
    data['modifiedOn'] = this.modifiedOn;
    data['label'] = this.label;
    data['gender'] = this.gender;
    data['age'] = this.age;
    if (this.point != null) {
      data['point'] = this.point.toJson();
    }
    data['occupation'] = this.occupation;
    data['reportedOn'] = this.reportedOn;
    data['currentState'] = this.currentState;
    data['source'] = this.source;
    data['comment'] = this.comment;
    data['nationality'] = this.nationality;
    data['ward'] = this.ward;
    return data;
  }
}

class Point {
  String type;
  List<double> coordinates;

  Point({this.type, this.coordinates});

  Point.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}
