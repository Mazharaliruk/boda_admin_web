// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class BusinessModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  String? image_url;
  bool is_active;
  String? slug;
  String? icon_url;
  String? description;
  int business_type_id;
  BusinessModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    this.image_url,
    required this.is_active,
    this.slug,
    this.icon_url,
    this.description,
    required this.business_type_id,
  });

  BusinessModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    String? image_url,
    bool? is_active,
    String? slug,
    String? icon_url,
    String? description,
    int? business_type_id,
  }) {
    return BusinessModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      image_url: image_url ?? this.image_url,
      is_active: is_active ?? this.is_active,
      slug: slug ?? this.slug,
      icon_url: icon_url ?? this.icon_url,
      description: description ?? this.description,
      business_type_id: business_type_id ?? this.business_type_id,
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
      'business_type_id': business_type_id,
    };
  }

  factory BusinessModel.fromMap(Map<String, dynamic> map) {
    return BusinessModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      is_active: map['is_active'] as bool,
      slug: map['slug'] != null ? map['slug'] as String : null,
      icon_url: map['icon_url'] != null ? map['icon_url'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      business_type_id: map['business_type_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessModel.fromJson(String source) => BusinessModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BusinessModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, image_url: $image_url, is_active: $is_active, slug: $slug, icon_url: $icon_url, description: $description, business_type_id: $business_type_id)';
  }

  @override
  bool operator ==(covariant BusinessModel other) {
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
      other.description == description &&
      other.business_type_id == business_type_id;
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
      description.hashCode ^
      business_type_id.hashCode;
  }
}
