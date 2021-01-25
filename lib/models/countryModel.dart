class AllCountries {
  List<Countries> data;
  String error;
  AllCountries({this.data, this.error});

  AllCountries.fromJson(List<dynamic> json) {
    if (json != null) {
      data = <Countries>[];
      json.forEach((v) {
        data.add(Countries.fromJson(v));
      });
    }
  }
  AllCountries.withError(String errorVal) {
    data = [];
    error = errorVal;
  }
}

class Countries {
  String sId;
  String country;
  int totalCases;
  int newCases;
  int totalDeaths;
  int newDeaths;
  int activeCases;
  int totalRecovered;
  int criticalCases;
  int iV;

  Countries(
      {this.sId,
      this.country,
      this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.activeCases,
      this.totalRecovered,
      this.criticalCases,
      this.iV});

  Countries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    totalCases = json['totalCases'];
    newCases = json['newCases'];
    totalDeaths = json['totalDeaths'];
    newDeaths = json['newDeaths'];
    activeCases = json['activeCases'];
    totalRecovered = json['totalRecovered'];
    criticalCases = json['criticalCases'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['country'] = country;
    data['totalCases'] = totalCases;
    data['newCases'] = newCases;
    data['totalDeaths'] = totalDeaths;
    data['newDeaths'] = newDeaths;
    data['activeCases'] = activeCases;
    data['totalRecovered'] = totalRecovered;
    data['criticalCases'] = criticalCases;
    data['__v'] = iV;
    return data;
  }
}
