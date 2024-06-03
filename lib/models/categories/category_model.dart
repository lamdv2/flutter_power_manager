import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? id;
  final String? title;
  final String? image;

  CategoryModel({
    this.id,
    this.title,
    this.image,
  });

  factory CategoryModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final json = document.data()!;
    return CategoryModel(
      id: document.id,
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
