class AddressResponse {
  AddressResponse({
    required this.address,
  });
  late final Address address;

  AddressResponse.fromJson(Map<String, dynamic> json){
    address = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.toJson();
    return _data;
  }
}

class Address {
  Address({
    required this.userId,
    required this.city,
    required this.country,
    required this.postcode,
    required this.street,
    required this.building,
    required this.floor,
    required this.phone,
    required this.notes,
    required this.lat,
    required this.lng,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final int userId;
  late final String city;
  late final String country;
  late final String postcode;
  late final String street;
  late final String building;
  late final String floor;
  late final String phone;
  late final String notes;
  late final String lat;
  late final String lng;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Address.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    city = json['city'];
    country = json['country'];
    postcode = json['postcode'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    phone = json['phone'];
    notes = json['notes'];
    lat = json['lat'];
    lng = json['lng'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['city'] = city;
    _data['country'] = country;
    _data['postcode'] = postcode;
    _data['street'] = street;
    _data['building'] = building;
    _data['floor'] = floor;
    _data['phone'] = phone;
    _data['notes'] = notes;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}