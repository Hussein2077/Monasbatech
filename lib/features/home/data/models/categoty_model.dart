import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final int? id;
  final String? name;
  final String? nameEn;
  final String? image;
  final String? type;
  final int? categoryID;

  const CategoryModel({
     this.id,
     this.name,
    this.categoryID,
     this.nameEn,
     this.image,
     this.type,

  });

  @override
  List<Object?> get props => [id, name, nameEn, image, type];

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['Name'] ?? "",
      nameEn: json['NameEn'] ?? "",
      image: json['image'] ?? "",
      type: json['type'] ?? "",
      categoryID: json['CategoryId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Name': name,
      'NameEn': nameEn,
      'image': image,
      'type': type,
    };
  }
}

