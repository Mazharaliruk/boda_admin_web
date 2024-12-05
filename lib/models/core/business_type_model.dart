// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class BusinessTypeModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  String? image_url;
  bool is_active;
  String? slug;
  String? icon_url;
  String? description;
  BusinessTypeModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    this.image_url,
    required this.is_active,
    this.slug,
    this.icon_url,
    this.description,
  });

  BusinessTypeModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    String? image_url,
    bool? is_active,
    String? slug,
    String? icon_url,
    String? description,
  }) {
    return BusinessTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      image_url: image_url ?? this.image_url,
      is_active: is_active ?? this.is_active,
      slug: slug ?? this.slug,
      icon_url: icon_url ?? this.icon_url,
      description: description ?? this.description,
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
      'icon_url': icon_url,
      'description': description,
    };
  }

  factory BusinessTypeModel.fromMap(Map<String, dynamic> map) {
    return BusinessTypeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      is_active: map['is_active'] as bool,
      slug: map['slug'] != null ? map['slug'] as String : null,
      icon_url: map['icon_url'] != null ? map['icon_url'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessTypeModel.fromJson(String source) => BusinessTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusinessTypeModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, image_url: $image_url, is_active: $is_active, slug: $slug, icon_url: $icon_url, description: $description)';
  }

  @override
  bool operator ==(covariant BusinessTypeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.image_url == image_url &&
      other.is_active == is_active &&
      other.slug == slug &&
      other.icon_url == icon_url &&
      other.description == description;
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
      icon_url.hashCode ^
      description.hashCode;
  }
}
