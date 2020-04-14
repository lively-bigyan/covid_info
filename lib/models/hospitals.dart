class Hospitals {
  List<Data> data;
  int total;
  int limit;
  int start;
  int page;
  String error;

  Hospitals(
      {this.data, this.total, this.limit, this.start, this.page, this.error});

  Hospitals.fromJson(Map<String, dynamic> json) {
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
  Hospitals.withError(String errorVal) {
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
  Location location;
  bool isFull;
  bool governmentApproved;
  String name;
  String contactPerson;
  String contactPersonNumber;
  String address;
  String phone;
  String website;
  String email;
  String notes;
  String hospitalId;
  String state;
  String imageUrl;
  String source;
  Capacity capacity;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.sId,
      this.location,
      this.isFull,
      this.governmentApproved,
      this.name,
      this.contactPerson,
      this.contactPersonNumber,
      this.address,
      this.phone,
      this.website,
      this.email,
      this.notes,
      this.hospitalId,
      this.state,
      this.imageUrl,
      this.source,
      this.capacity,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    isFull = json['is_full'];
    governmentApproved = json['government_approved'];
    name = json['name'];
    contactPerson = json['contact_person'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    phone = json['phone'];
    website = json['website'];
    email = json['email'];
    notes = json['notes'];
    hospitalId = json['hospital_id'];
    state = json['state'];
    imageUrl = json['image_url'];
    source = json['source'];
    capacity = json['capacity'] != null
        ? new Capacity.fromJson(json['capacity'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['is_full'] = this.isFull;
    data['government_approved'] = this.governmentApproved;
    data['name'] = this.name;
    data['contact_person'] = this.contactPerson;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['email'] = this.email;
    data['notes'] = this.notes;
    data['hospital_id'] = this.hospitalId;
    data['state'] = this.state;
    data['image_url'] = this.imageUrl;
    data['source'] = this.source;
    if (this.capacity != null) {
      data['capacity'] = this.capacity.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  String type;
  List<double> coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
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

class Capacity {
  String beds;
  String ventilators;
  String isolationBeds;
  String occupiedBeds;
  String doctors;
  String nurses;

  Capacity(
      {this.beds,
      this.ventilators,
      this.isolationBeds,
      this.occupiedBeds,
      this.doctors,
      this.nurses});

  Capacity.fromJson(Map<String, dynamic> json) {
    beds = json['beds'];
    ventilators = json['ventilators'];
    isolationBeds = json['isolation_beds'];
    occupiedBeds = json['occupied_beds'];
    doctors = json['doctors'];
    nurses = json['nurses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beds'] = this.beds;
    data['ventilators'] = this.ventilators;
    data['isolation_beds'] = this.isolationBeds;
    data['occupied_beds'] = this.occupiedBeds;
    data['doctors'] = this.doctors;
    data['nurses'] = this.nurses;
    return data;
  }
}
