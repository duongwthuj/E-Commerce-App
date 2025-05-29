import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String? parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId,
    required this.isFeatured,
  });

  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        image: '',
        parentId: '',
        isFeatured: false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'parentId': parentId,
        'isFeatured': isFeatured,
      };

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return CategoryModel.empty();
    return CategoryModel(
      id: document.id,
      name: data['Name'] ?? '',
      image: data['image'] ?? '',
      parentId: data['ParentId'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
    );
  }
}
