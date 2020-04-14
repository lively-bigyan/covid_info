class AllCountries {
  List<District> data;
  String error;
  AllCountries({this.data, this.error});

  AllCountries.fromJson(List<dynamic> json) {
    if (json != null) {
      data = List<District>();
      json.forEach((v) {
        data.add(new District.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['District'] = this.district;
    data['Zone'] = this.zone;
    data['Geographical Region'] = this.geographicalRegion;
    data['Region'] = this.region;
    data['District_code'] = this.districtCode;
    data['VDC_name'] = this.vDCName;
    data['VDC_code'] = this.vDCCode;
    return data;
  }
}