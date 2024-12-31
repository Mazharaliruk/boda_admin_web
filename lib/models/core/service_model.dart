// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import '../../core/enums/payment/currency.dart';

class ServiceModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  int vendor;
  int business;
  bool is_active;
  double price;
  Currency currency;
  String? description;
  ServiceModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.vendor,
    required this.business,
    required this.is_active,
    required this.price,
    required this.currency,
    this.description,
  });

  ServiceModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    int? vendor,
    int? category,
    int? business,
    bool? is_active,
    double? price,
    Currency? currency,
    String? description,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      vendor: vendor ?? this.vendor,
      business: business ?? this.business,
      is_active: is_active ?? this.is_active,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'vendor': vendor,
      'business': business,
      'is_active': is_active,
      'price': price,
      'currency': currency,
      'description': description,
    };
  }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      vendor: map['vendor'] as int,
      business: map['business'] as int,
      is_active: map['is_active'] as bool,
      price: map['price'] as double,
      currency: Currency.values.firstWhere((x) => x.name == map['currency']),
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) => ServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, vendor: $vendor, business: $business, is_active: $is_active, price: $price, currency: $currency, description: $description)';
  }

  @override
  bool operator ==(covariant ServiceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.vendor == vendor &&
      other.business == business &&
      other.is_active == is_active &&
      other.price == price &&
      other.currency == currency &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      vendor.hashCode ^
      business.hashCode ^
      is_active.hashCode ^
      price.hashCode ^
      currency.hashCode ^
      description.hashCode;
  }
}
