class AllCountries {
  List<District> data;
  String error;
  AllCountries({this.data, this.error});

  AllCountries.fromJson(List<dynamic> json) {
    if (json != null) {
      data = <District>[];
      json.forEach((v) {
        data.add(District.fromJson(v));
      });
    }
  }
  AllCountries.withError(String errorVal) {
    data = [];
    error = errorVal;
  }
}

class District {
  String district;
  String zone;
  String geographicalRegion;
  String region;
  int districtCode;
  String vDCName;
  int vDCCode;

  District(
      {this.district,
      this.zone,
      this.geographicalRegion,
      this.region,
      this.districtCode,
      this.vDCName,
      this.vDCCode});

  District.fromJson(Map<String, dynamic> json) {
    district = json['District'];
    zone = json['Zone'];
    geographicalRegion = json['Geographical Region'];
    region = json['Region'];
    districtCode = json['District_code'];
    vDCName = json['VDC_name'];
    vDCCode = json['VDC_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['District'] = district;
    data['Zone'] = zone;
    data['Geographical Region'] = geographicalRegion;
    data['Region'] = region;
    data['District_code'] = districtCode;
    data['VDC_name'] = vDCName;
    data['VDC_code'] = vDCCode;
    return data;
  }
}
