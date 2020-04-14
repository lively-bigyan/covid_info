class NepalStats {
  int testedPositive;
  int testedNegative;
  int testedTotal;
  int inIsolation;
  int pendingResult;
  int recovered;
  int deaths;
  String source;
  String updatedAt;
  LatestSitReport latestSitReport;
  String error;

  NepalStats(
      {this.testedPositive,
      this.testedNegative,
      this.testedTotal,
      this.inIsolation,
      this.pendingResult,
      this.recovered,
      this.deaths,
      this.source,
      this.updatedAt,
      this.latestSitReport,
      this.error});

  NepalStats.fromJson(Map<String, dynamic> json) {
    testedPositive = json['tested_positive'];
    testedNegative = json['tested_negative'];
    testedTotal = json['tested_total'];
    inIsolation = json['in_isolation'];
    pendingResult = json['pending_result'];
    recovered = json['recovered'];
    deaths = json['deaths'];
    source = json['source'];
    updatedAt = json['updated_at'];
    latestSitReport = json['latest_sit_report'] != null
        ? new LatestSitReport.fromJson(json['latest_sit_report'])
        : null;
  }
  NepalStats.withError(String errorVal) {
    error=errorVal;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tested_positive'] = this.testedPositive;
    data['tested_negative'] = this.testedNegative;
    data['tested_total'] = this.testedTotal;
    data['in_isolation'] = this.inIsolation;
    data['pending_result'] = this.pendingResult;
    data['recovered'] = this.recovered;
    data['deaths'] = this.deaths;
    data['source'] = this.source;
    data['updated_at'] = this.updatedAt;
    if (this.latestSitReport != null) {
      data['latest_sit_report'] = this.latestSitReport.toJson();
    }
    return data;
  }
}

class LatestSitReport {
  String type;
  String sId;
  int no;
  String date;
  String url;
  String createdAt;
  String updatedAt;
  int iV;

  LatestSitReport(
      {this.type,
      this.sId,
      this.no,
      this.date,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.iV});

  LatestSitReport.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    no = json['no'];
    date = json['date'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['_id'] = this.sId;
    data['no'] = this.no;
    data['date'] = this.date;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
