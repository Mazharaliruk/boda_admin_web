// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:admin_boda/core/enums/core/event_service_status.dart';

import '../../core/enums/payment/currency.dart';

class EventServiceModel {
  int id;
  DateTime created_at;
  DateTime updated_at;
  int event;
  int service;
 int vendor;
 int? quantity;
 double price;
 Currency currency;
 EventServiceStatus status;
  EventServiceModel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.event,
    required this.service,
    required this.vendor,
    this.quantity,
    required this.price,
    required this.currency,
    required this.status,
  });

  EventServiceModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    int? event,
    int? service,
    int? vendor,
    int? quantity,
    double? price,
    Currency? currency,
    EventServiceStatus? status,
  }) {
    return EventServiceModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      event: event ?? this.event,
      service: service ?? this.service,
      vendor: vendor ?? this.vendor,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      currency: currency ?? this.currency,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'event': event,
      'service': service,
      'vendor': vendor,
      'quantity': quantity,
      'price': price,
      'currency': currency,
      'status': status,
    };
  }

  factory EventServiceModel.fromMap(Map<String, dynamic> map) {
    return EventServiceModel(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      event: map['event'] as int,
      service: map['service'] as int,
      vendor: map['vendor'] as int,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      price: map['price'] as double,
      currency: Currency.values.firstWhere((e) => e.name == map['currency']),
      status: EventServiceStatus.values.firstWhere((e) => e.name == map['status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventServiceModel.fromJson(String source) => EventServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventServiceModel(id: $id, created_at: $created_at, updated_at: $updated_at, event: $event, service: $service, vendor: $vendor, quantity: $quantity, price: $price, currency: $currency, status: $status)';
  }

  @override
  bool operator ==(covariant EventServiceModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.event == event &&
      other.service == service &&
      other.vendor == vendor &&
      other.quantity == quantity &&
      other.price == price &&
      other.currency == currency &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      event.hashCode ^
      service.hashCode ^
      vendor.hashCode ^
      quantity.hashCode ^
      price.hashCode ^
      currency.hashCode ^
      status.hashCode;
  }
}
