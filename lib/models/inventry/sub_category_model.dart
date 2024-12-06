// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class SubCategoryModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  String? image_url;
  bool is_active;
  String? slug;
  int category;
  SubCategoryModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    this.image_url,
    required this.is_active,
    this.slug,
    required this.category,
  });

  SubCategoryModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    String? image_url,
    bool? is_active,
    String? slug,
    int? category,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      image_url: image_url ?? this.image_url,
      is_active: is_active ?? this.is_active,
      slug: slug ?? this.slug,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'image_url': image_url,
      'is_active': is_active,
      'slug': slug,
      'category': category,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      updated_at: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      is_active: map['is_active'] as bool,
      slug: map['slug'] != null ? map['slug'] as String : null,
      category: map['category'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryModel.fromJson(String source) => SubCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubCategoryModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, image_url: $image_url, is_active: $is_active, slug: $slug, category: $category)';
  }

  @override
  bool operator ==(covariant SubCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.image_url == image_url &&
      other.is_active == is_active &&
      other.slug == slug &&
      other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      image_url.hashCode ^
      is_active.hashCode ^
      slug.hashCode ^
      category.hashCode;
  }
}
