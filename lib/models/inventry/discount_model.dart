// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class DiscountModel {
   int id;
   String name;
   DateTime created_at;
   DateTime updated_at;
   int vendor_id;
   int promotion;
   int service;
   String? image_url;
   String? description;
   bool is_active;
   double? discount_percent;
   DateTime? start_date;
   DateTime? end_date;
  DiscountModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.vendor_id,
    required this.promotion,
    required this.service,
    this.image_url,
    this.description,
    required this.is_active,
    this.discount_percent,
    this.start_date,
    this.end_date,
  });
  

  DiscountModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    int? vendor_id,
    int? promotion,
    int? service,
    String? image_url,
    String? description,
    bool? is_active,
    double? discount_percent,
    DateTime? start_date,
    DateTime? end_date,
  }) {
    return DiscountModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      vendor_id: vendor_id ?? this.vendor_id,
      promotion: promotion ?? this.promotion,
      service: service ?? this.service,
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
      'promotion': promotion,
      'service': service,
      'image_url': image_url,
      'description': description,
      'is_active': is_active,
      'discount_percent': discount_percent,
      'start_date': start_date?.millisecondsSinceEpoch,
      'end_date': end_date?.millisecondsSinceEpoch,
    };
  }

  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
      updated_at: DateTime.fromMillisecondsSinceEpoch(map['updated_at'] as int),
      vendor_id: map['vendor_id'] as int,
      promotion: map['promotion'] as int,
      service: map['service'] as int,
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      is_active: map['is_active'] as bool,
      discount_percent: map['discount_percent'] != null ? map['discount_percent'] as double : null,
      start_date: map['start_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['start_date'] as int) : null,
      end_date: map['end_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['end_date'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountModel.fromJson(String source) => DiscountModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DiscountModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, vendor_id: $vendor_id, promotion: $promotion, service: $service, image_url: $image_url, description: $description, is_active: $is_active, discount_percent: $discount_percent, start_date: $start_date, end_date: $end_date)';
  }

  @override
  bool operator ==(covariant DiscountModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.vendor_id == vendor_id &&
      other.promotion == promotion &&
      other.service == service &&
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
      promotion.hashCode ^
      service.hashCode ^
      image_url.hashCode ^
      description.hashCode ^
      is_active.hashCode ^
      discount_percent.hashCode ^
      start_date.hashCode ^
      end_date.hashCode;
  }
}
