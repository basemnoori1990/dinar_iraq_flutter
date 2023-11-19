class CartResponse {
  CartResponse({
    required this.cart,
  });
  late final List<Cart> cart;

  CartResponse.fromJson(Map<String, dynamic> json){
    cart = List.from(json['cart']).map((e)=>Cart.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cart'] = cart.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Cart {
  Cart({
    required this.id,
    required this.productId,
    required this.userId,
    required this.unitId,
    required this.quantity,
    required this.price,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
    this.unit,
  });
  late final int id;
  late final String productId;
  late final String userId;
  late final String unitId;
  late final String quantity;
  late final String price;
  late final String status;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;
  late final Product product;
  late final Unit? unit;

  Cart.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    unitId = json['unit_id'];
    quantity = json['quantity'];
    price = json['price'];
    status = json['status'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = Product.fromJson(json['product']);
    unit = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_id'] = productId;
    _data['user_id'] = userId;
    _data['unit_id'] = unitId;
    _data['quantity'] = quantity;
    _data['price'] = price;
    _data['status'] = status;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['product'] = product.toJson();
    _data['unit'] = unit;
    return _data;
  }
}

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.wholeSalePrice,
    required this.retailPrice,
    required this.vipPrice,
    required this.categoryId,
    required this.companyId,
    required this.unitGroupId,
    required this.wholeUnitId,
    required this.retailUnitId,
    required this.vipUnitId,
    required this.discount,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String productName;
  late final String description;
  late final String image;
  late final String wholeSalePrice;
  late final String retailPrice;
  late final String vipPrice;
  late final String categoryId;
  late final String companyId;
  late final String unitGroupId;
  late final String wholeUnitId;
  late final String retailUnitId;
  late final String vipUnitId;
  late final String discount;
  late final String status;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  Product.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productName = json['product_name'];
    description = json['description'];
    image = json['image'];
    wholeSalePrice = json['whole_sale_price'];
    retailPrice = json['retail_price'];
    vipPrice = json['vip_price'];
    categoryId = json['category_id'];
    companyId = json['company_id'];
    unitGroupId = json['unit_group_id'];
    wholeUnitId = json['whole_unit_id'];
    retailUnitId = json['retail_unit_id'];
    vipUnitId = json['vip_unit_id'];
    discount = json['discount'];
    status = json['status'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['product_name'] = productName;
    _data['description'] = description;
    _data['image'] = image;
    _data['whole_sale_price'] = wholeSalePrice;
    _data['retail_price'] = retailPrice;
    _data['vip_price'] = vipPrice;
    _data['category_id'] = categoryId;
    _data['company_id'] = companyId;
    _data['unit_group_id'] = unitGroupId;
    _data['whole_unit_id'] = wholeUnitId;
    _data['retail_unit_id'] = retailUnitId;
    _data['vip_unit_id'] = vipUnitId;
    _data['discount'] = discount;
    _data['status'] = status;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Unit {
  Unit({
    required this.id,
    required this.unitName,
    required this.eq,
    required this.unitGroupId,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String unitName;
  late final String eq;
  late final String unitGroupId;
  late final String status;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json){
    id = json['id'];
    unitName = json['unit_name'];
    eq = json['eq'];
    unitGroupId = json['unit_group_id'];
    status = json['status'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['unit_name'] = unitName;
    _data['eq'] = eq;
    _data['unit_group_id'] = unitGroupId;
    _data['status'] = status;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}