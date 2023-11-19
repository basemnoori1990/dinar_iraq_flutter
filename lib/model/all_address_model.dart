class AllMyAddress {
  AllMyAddress({
    required this.address,
  });
  late final List<Address> address;

  AllMyAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'] == null
        ? []
        : List.from(json['address']).map((e) => Address.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Address {
  Address({
    required this.id,
    required this.userId,
    required this.city,
    required this.country,
    required this.postcode,
    required this.street,
    required this.building,
    required this.floor,
    required this.phone,
    required this.lng,
    required this.lat,
    required this.notes,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
  late final String city;
  late final String country;
  late final String postcode;
  late final String street;
  late final String building;
  late final String floor;
  late final String phone;
  late final String lng;
  late final String lat;
  late final String notes;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    city = json['city'];
    country = json['country'];
    postcode = json['postcode'];
    street = json['street'];
    building = json['building'];
    floor = json['floor'];
    phone = json['phone'];
    lng = json['lng'];
    lat = json['lat'];
    notes = json['notes'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['city'] = city;
    _data['country'] = country;
    _data['postcode'] = postcode;
    _data['street'] = street;
    _data['building'] = building;
    _data['floor'] = floor;
    _data['phone'] = phone;
    _data['lng'] = lng;
    _data['lat'] = lat;
    _data['notes'] = notes;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
