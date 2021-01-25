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
  Hospitals.withError(String errorVal) {
    total = 0;
    limit = 0;
    start = 0;
    page = 0;
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
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
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
    capacity =
        json['capacity'] != null ? Capacity.fromJson(json['capacity']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    if (location != null) {
      data['location'] = location.toJson();
    }
    data['is_full'] = isFull;
    data['government_approved'] = governmentApproved;
    data['name'] = name;
    data['contact_person'] = contactPerson;
    data['contact_person_number'] = contactPersonNumber;
    data['address'] = address;
    data['phone'] = phone;
    data['website'] = website;
    data['email'] = email;
    data['notes'] = notes;
    data['hospital_id'] = hospitalId;
    data['state'] = state;
    data['image_url'] = imageUrl;
    data['source'] = source;
    if (capacity != null) {
      data['capacity'] = capacity.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
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
    final data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
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
    final data = <String, dynamic>{};
    data['beds'] = beds;
    data['ventilators'] = ventilators;
    data['isolation_beds'] = isolationBeds;
    data['occupied_beds'] = occupiedBeds;
    data['doctors'] = doctors;
    data['nurses'] = nurses;
    return data;
  }
}
