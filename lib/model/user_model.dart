class UserModel {
  late int id;
  late String name;
  late String username;
  late String email;
  late Address address;
  late String phone;
  late String website;
  late Company company;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = Address.fromJson(json['address']);
    phone = json['phone'];
    website = json['website'];
    company = Company.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['username'] = username;
    json['email'] = email;
    json['address'] = address.toJson();
    json['phone'] = phone;
    json['website'] = website;
    json['company'] = company.toJson();
    return json;
  }
}

class Address {
  late String street;
  late String suite;
  late String city;
  late String zipcode;
  late Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = Geo.fromJson(json['geo']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['street'] = street;
    json['suite'] = suite;
    json['city'] = city;
    json['zipcode'] = zipcode;
    json['geo'] = geo.toJson();
    return json;
  }
}

class Geo {
  late String lat;
  late String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  Geo.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['lat'] = lat;
    json['lng'] = lng;
    return json;
  }
}

class Company {
  late String name;
  late String catchPhrase;
  late String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catchPhrase = json['catchPhrase'];
    bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['catchPhrase'] = catchPhrase;
    json['bs'] = bs;
    return json;
  }
}