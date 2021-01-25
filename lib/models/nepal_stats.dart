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
        ? LatestSitReport.fromJson(json['latest_sit_report'])
        : null;
  }
  NepalStats.withError(String errorVal) {
    error = errorVal;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tested_positive'] = testedPositive;
    data['tested_negative'] = testedNegative;
    data['tested_total'] = testedTotal;
    data['in_isolation'] = inIsolation;
    data['pending_result'] = pendingResult;
    data['recovered'] = recovered;
    data['deaths'] = deaths;
    data['source'] = source;
    data['updated_at'] = updatedAt;
    if (latestSitReport != null) {
      data['latest_sit_report'] = latestSitReport.toJson();
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
    final data = <String, dynamic>{};
    data['type'] = type;
    data['_id'] = sId;
    data['no'] = no;
    data['date'] = date;
    data['url'] = url;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
