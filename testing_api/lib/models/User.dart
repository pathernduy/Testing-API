// class User {
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;

//   User(
//       {this.id,
//       this.name,
//       this.username,
//       this.email,
//       this.address,
//       this.phone,
//       this.website,
//       this.company});

//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     username = json['username'];
//     email = json['email'];
//     address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//     phone = json['phone'];
//     website = json['website'];
//     company =
//         json['company'] != null ? new Company.fromJson(json['company']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     if (this.address != null) {
//       data['address'] = this.address!.toJson();
//     }
//     data['phone'] = this.phone;
//     data['website'] = this.website;
//     if (this.company != null) {
//       data['company'] = this.company!.toJson();
//     }
//     return data;
//   }
// }

// class Address {
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;

//   Address({this.street, this.suite, this.city, this.zipcode, this.geo});

//   Address.fromJson(Map<String, dynamic> json) {
//     street = json['street'];
//     suite = json['suite'];
//     city = json['city'];
//     zipcode = json['zipcode'];
//     geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['street'] = this.street;
//     data['suite'] = this.suite;
//     data['city'] = this.city;
//     data['zipcode'] = this.zipcode;
//     if (this.geo != null) {
//       data['geo'] = this.geo!.toJson();
//     }
//     return data;
//   }
// }

// class Geo {
//   String? lat;
//   String? lng;

//   Geo({this.lat, this.lng});

//   Geo.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     return data;
//   }
// }

// class Company {
//   String? name;
//   String? catchPhrase;
//   String? bs;

//   Company({this.name, this.catchPhrase, this.bs});

//   Company.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     catchPhrase = json['catchPhrase'];
//     bs = json['bs'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['catchPhrase'] = this.catchPhrase;
//     data['bs'] = this.bs;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final User = UserFromJson(jsonString);

import 'dart:convert';

List<User> UserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String UserToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
