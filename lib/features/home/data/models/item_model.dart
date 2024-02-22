// class ItemModel {
//   List<ItemData>? data;
//
//   ItemModel({
//     this.data,
//   });
//
//   factory ItemModel.fromJson(Map<String, dynamic> json) {
//     return ItemModel(
//       data: json['data'] != null
//           ? List<ItemData>.from(json['data'].map((x) => ItemData.fromJson(x)))
//           : null,
//     );
//   }
// }

class ItemData {
  int? id;
  String? name;
  String? nameEn;
  String? description;
  String? descriptionEn;
  int? price;
  int? discount;
  String? imagePath;
  int? averageRating;
  Provider? provider;
  Categories? categories;
  Subcategories? subcategories;
  List<dynamic>? prices;
  List<dynamic>? images;

  ItemData({
    this.id,
    this.name,
    this.nameEn,
    this.description,
    this.descriptionEn,
    this.price,
    this.discount,
    this.imagePath,
    this.averageRating,
    this.provider,
    this.categories,
    this.subcategories,
    this.prices,
    this.images,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) {
    return ItemData(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      nameEn: json['nameEn'] ?? "",
      description: json['description'] ?? "",
      descriptionEn: json['descriptionEn'] ?? "",
      price: json['price'] ?? 0,
      discount: json['discount'] ?? 0,
      imagePath: json['image_path'] ?? "",
      averageRating: json['average_rating'] ?? 0,
      provider:
          json['provider'] != null ? Provider.fromJson(json['provider']) : null,
      categories: json['categories'] != null
          ? Categories.fromJson(json['categories'])
          : null,
      subcategories: json['subcategories'] != null
          ? Subcategories.fromJson(json['subcategories'])
          : null,
      prices:
          json['prices'] != null ? List<dynamic>.from(json['prices']) : null,
      images:
          json['images'] != null ? List<dynamic>.from(json['images']) : null,
    );
  }
}

class Provider {
  int? id;
  String? name;
  String? profileImage;
  String? backGroudImage;

  Provider({
    this.id,
    this.name,
    this.profileImage,
    this.backGroudImage,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      profileImage: json['profileImage'] ?? "",
      backGroudImage: json['backGroudImage'] ?? "",
    );
  }
}

class Categories {
  int? id;
  String? name;
  String? nameEn;
  String? image;

  Categories({
    this.id,
    this.name,
    this.nameEn,
    this.image,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] ?? 0,
      name: json['Name'] ?? "",
      nameEn: json['NameEn'] ?? "",
      image: json['image'] ?? "",
    );
  }
}

class Subcategories {
  int? id;
  String? name;
  String? nameEn;
  String? image;

  Subcategories({
    this.id,
    this.name,
    this.nameEn,
    this.image,
  });

  factory Subcategories.fromJson(Map<String, dynamic> json) {
    return Subcategories(
      id: json['id'] ?? 0,
      name: json['Name'] ?? "",
      nameEn: json['NameEn'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
