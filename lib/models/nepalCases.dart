class AffectedInNepal {
  List<Data> data;
  String error;

  AffectedInNepal({this.data, this.error});

  AffectedInNepal.fromJson(List<dynamic> json) {
    if (json != null) {
      data = <Data>[];
      json.forEach((v) {
        final jsonToData = Data.fromJson(v);
        data.add(jsonToData);
      });
    }
  }
  AffectedInNepal.withError(String errorVal) {
    data = [];
    error = errorVal;
  }
}

class Data {
  Data({
    this.id,
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
    this.recoveredOn,
    this.deathOn,
    this.currentState,
    this.isReinfected,
    this.source,
    this.comment,
    this.type,
    this.nationality,
    this.ward,
    this.relatedTo,
  });

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
  dynamic occupation;
  String reportedOn;
  String recoveredOn;
  dynamic deathOn;
  String currentState;
  bool isReinfected;
  String source;
  String comment;
  String type;
  int nationality;
  int ward;
  List<dynamic> relatedTo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        province: json['province'],
        district: json['district'],
        municipality: json['municipality'],
        createdOn: json['createdOn'],
        modifiedOn: json['modifiedOn'],
        label: json['label'],
        gender: json['gender'],
        age: json['age'],
        point: Point.fromJson(json['point']),
        occupation: json['occupation'],
        reportedOn: json['reportedOn'],
        recoveredOn: json['recoveredOn'],
        deathOn: json['deathOn'],
        currentState: json['currentState'],
        isReinfected: json['isReinfected'],
        source: json['source'],
        comment: json['comment'],
        type: json['type'],
        nationality: json['nationality'],
        ward: json['ward'],
        relatedTo: List<dynamic>.from(json['relatedTo'].map((x) => x)),
      );
}

class Point {
  Point({
    this.type,
    this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        type: json['type'],
        coordinates:
            List<double>.from(json['coordinates'].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': List<dynamic>.from(coordinates.map((x) => x)),
      };
}
