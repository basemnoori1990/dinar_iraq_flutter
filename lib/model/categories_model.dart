class CategoriesResponse {
  CategoriesResponse({
    required this.categories,
  });
  late final List<Categories> categories;

  CategoriesResponse.fromJson(Map<String, dynamic> json){
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.categoryName,
    required this.description,
    required this.image,
    required this.parentId,
    required this.status,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String categoryName;
  late final String description;
  late final String image;
  late final String parentId;
  late final String status;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryName = json['category_name'];
    description = json['description'];
    image = json['image'];
    parentId = json['parent_id'];
    status = json['status'];
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category_name'] = categoryName;
    _data['description'] = description;
    _data['image'] = image;
    _data['parent_id'] = parentId;
    _data['status'] = status;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}