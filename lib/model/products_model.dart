class ProductsResponse {
  ProductsResponse({
    required this.products,
  });
  late final List<Products> products;

  ProductsResponse.fromJson(Map<String, dynamic> json){
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.productName,
    required this.description,
    required this.image,
    required this.wholeSalePrice,
    required this.retailPrice,
    required this.categoryId,
    required this.companyId,
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
  late final String categoryId;
  late final String companyId;
  late final String discount;
  late final String status;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  Products.fromJson(Map<String, dynamic> json){
    id = json['id'];
    productName = json['product_name'];
    description = json['description'];
    image = json['image'];
    wholeSalePrice = json['whole_sale_price'];
    retailPrice = json['retail_price'];
    categoryId = json['category_id'];
    companyId = json['company_id'];
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
    _data['category_id'] = categoryId;
    _data['company_id'] = companyId;
    _data['discount'] = discount;
    _data['status'] = status;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}