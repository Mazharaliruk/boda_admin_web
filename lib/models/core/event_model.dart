// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:admin_boda/core/enums/payment/currency.dart';

import '../../core/enums/payment/status.dart';

class EventModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  String? description;
  int? user;
  String? location;
  DateTime? start_date;
  DateTime? end_date;
  double? price;
  Currency currency;
  String? image_url;
  int guest_count;
  double budget;
  Status status;
  int? maximum_capacity;
  int? minimum_capacity;
  int? business;
  EventModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    this.description,
    this.user,
    this.location,
    this.start_date,
    this.end_date,
    this.price,
    required this.currency,
    this.image_url,
    required this.guest_count,
    required this.budget,
    required this.status,
    this.maximum_capacity,
    this.minimum_capacity,
    this.business,
  });


  EventModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    String? description,
    int? user,
    String? location,
    DateTime? start_date,
    DateTime? end_date,
    double? price,
    Currency? currency,
    String? image_url,
    int? guest_count,
    double? budget,
    Status? status,
    int? maximum_capacity,
    int? minimum_capacity,
    int? business,
  }) {
    return EventModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      description: description ?? this.description,
      user: user ?? this.user,
      location: location ?? this.location,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      image_url: image_url ?? this.image_url,
      guest_count: guest_count ?? this.guest_count,
      budget: budget ?? this.budget,
      status: status ?? this.status,
      maximum_capacity: maximum_capacity ?? this.maximum_capacity,
      minimum_capacity: minimum_capacity ?? this.minimum_capacity,
      business: business ?? this.business,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'description': description,
      'user': user,
      'location': location,
      'start_date': start_date?.millisecondsSinceEpoch,
      'end_date': end_date?.millisecondsSinceEpoch,
      'price': price,
      'currency': currency,
      'image_url': image_url,
      'guest_count': guest_count,
      'budget': budget,
      'status': status,
      'maximum_capacity': maximum_capacity,
      'minimum_capacity': minimum_capacity,
      'business': business,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      description: map['description'] != null ? map['description'] as String : null,
      user: map['user'] != null ? map['user'] as int : null,
      location: map['location'] != null ? map['location'] as String : null,
      start_date: map['start_date'] != null ? DateTime.parse(map['start_date'] as String) : null,
      end_date: map['end_date'] != null ? DateTime.parse(map['end_date'] as String) : null,
      price: map['price'] != null ? map['price'] as double : null,
      currency: Currency.values.firstWhere((e) => e.name == map['currency']),
      image_url: map['image_url'] != null ? map['image_url'] as String : null,
      guest_count: map['guest_count'] as int,
      budget: map['budget'] as double,
      status: Status.values.firstWhere((e) => e.name == map['status']),
      maximum_capacity: map['maximum_capacity'] != null ? map['maximum_capacity'] as int : null,
      minimum_capacity: map['minimum_capacity'] != null ? map['minimum_capacity'] as int : null,
      business: map['business'] != null ? map['business'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, description: $description, user: $user, location: $location, start_date: $start_date, end_date: $end_date, price: $price, currency: $currency, image_url: $image_url, guest_count: $guest_count, budget: $budget, status: $status, maximum_capacity: $maximum_capacity, minimum_capacity: $minimum_capacity, business: $business)';
  }

  @override
  bool operator ==(covariant EventModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.description == description &&
      other.user == user &&
      other.location == location &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.price == price &&
      other.currency == currency &&
      other.image_url == image_url &&
      other.guest_count == guest_count &&
      other.budget == budget &&
      other.status == status &&
      other.maximum_capacity == maximum_capacity &&
      other.minimum_capacity == minimum_capacity &&
      other.business == business;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      description.hashCode ^
      user.hashCode ^
      location.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      price.hashCode ^
      currency.hashCode ^
      image_url.hashCode ^
      guest_count.hashCode ^
      budget.hashCode ^
      status.hashCode ^
      maximum_capacity.hashCode ^
      minimum_capacity.hashCode ^
      business.hashCode;
  }
}
