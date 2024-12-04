// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CategoriesModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  String? image_url;
  bool? is_active;
  String? slug;
  CategoriesModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    this.image_url,
    this.is_active,
    this.slug,
  });

  CategoriesModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    String? image_url,
    bool? is_active,
    String? slug,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      image_url: image_url ?? this.image_url,
      is_active: is_active ?? this.is_active,
      slug: slug ?? this.slug,
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
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.parse(map['created_at'] as String), // Parse ISO 8601 string
      updated_at: DateTime.parse(map['updated_at'] as String), // Parse ISO 8601 string
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      is_active: map['is_active'] != null ? map['is_active'] as bool : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) => CategoriesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CategoriesModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, image_url: $image_url, is_active: $is_active, slug: $slug)';
  }

  @override
  bool operator ==(covariant CategoriesModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.image_url == image_url &&
      other.is_active == is_active &&
      other.slug == slug;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      image_url.hashCode ^
      is_active.hashCode ^
      slug.hashCode;
  }
}
