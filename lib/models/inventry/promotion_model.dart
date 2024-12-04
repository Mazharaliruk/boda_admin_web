// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class PromotionModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  int vendor_id;
  String? image_url;
  String? description;
  bool is_active;
  double? discount_percent;
  DateTime? start_date;
  DateTime? end_date;
  PromotionModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.vendor_id,
    this.image_url,
    this.description,
    required this.is_active,
    this.discount_percent,
    this.start_date,
    this.end_date,
  });

 

  PromotionModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    int? vendor_id,
    String? image_url,
    String? description,
    bool? is_active,
    double? discount_percent,
    DateTime? start_date,
    DateTime? end_date,
  }) {
    return PromotionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      vendor_id: vendor_id ?? this.vendor_id,
      image_url: image_url ?? this.image_url,
      description: description ?? this.description,
      is_active: is_active ?? this.is_active,
      discount_percent: discount_percent ?? this.discount_percent,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'vendor_id': vendor_id,
      'image_url': image_url,
      'description': description,
      'is_active': is_active,
      'discount_percent': discount_percent,
      'start_date': start_date?.millisecondsSinceEpoch,
      'end_date': end_date?.millisecondsSinceEpoch,
    };
  }

  factory PromotionModel.fromMap(Map<String, dynamic> map) {
    return PromotionModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      updated_at: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
      vendor_id: map['vendor_id'] as int,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      is_active: map['is_active'] as bool,
      discount_percent: map['discount_percent'] != null ? map['discount_percent'] as double : null,
      start_date: map['start_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['start_date'] as int) : null,
      end_date: map['end_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['end_date'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PromotionModel.fromJson(String source) => PromotionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PromotionModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, vendor_id: $vendor_id, image_url: $image_url, description: $description, is_active: $is_active, discount_percent: $discount_percent, start_date: $start_date, end_date: $end_date)';
  }

  @override
  bool operator ==(covariant PromotionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.vendor_id == vendor_id &&
      other.image_url == image_url &&
      other.description == description &&
      other.is_active == is_active &&
      other.discount_percent == discount_percent &&
      other.start_date == start_date &&
      other.end_date == end_date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      vendor_id.hashCode ^
      image_url.hashCode ^
      description.hashCode ^
      is_active.hashCode ^
      discount_percent.hashCode ^
      start_date.hashCode ^
      end_date.hashCode;
  }
}
