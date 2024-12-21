// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:admin_boda/core/enums/payment/currency.dart';
import 'package:admin_boda/core/enums/payment/order_status.dart';

class OrderModel {
  int? id;
  DateTime created_at;
  DateTime updated_at;
  double? totalAmount;
  Currency currency;
  OrderStatus status;
  int customer_id;
  int vendor_id;
  int service_id;
  int event_id;
  DateTime? order_date;
  String? shipping_address;
  String? billing_address;
  double? discount_amount;
  double? tax_amount;
  String? note;
  OrderModel({
    this.id,
    required this.created_at,
    required this.updated_at,
    this.totalAmount,
    required this.currency,
    required this.status,
    required this.customer_id,
    required this.vendor_id,
    required this.service_id,
    required this.event_id,
    this.order_date,
    this.shipping_address,
    this.billing_address,
    this.discount_amount,
    this.tax_amount,
    this.note,
  });
  


  OrderModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    double? totalAmount,
    Currency? currency,
    OrderStatus? status,
    int? customer_id,
    int? vendor_id,
    int? service_id,
    int? event_id,
    DateTime? order_date,
    String? shipping_address,
    String? billing_address,
    double? discount_amount,
    double? tax_amount,
    String? note,
  }) {
    return OrderModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      totalAmount: totalAmount ?? this.totalAmount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      customer_id: customer_id ?? this.customer_id,
      vendor_id: vendor_id ?? this.vendor_id,
      service_id: service_id ?? this.service_id,
      event_id: event_id ?? this.event_id,
      order_date: order_date ?? this.order_date,
      shipping_address: shipping_address ?? this.shipping_address,
      billing_address: billing_address ?? this.billing_address,
      discount_amount: discount_amount ?? this.discount_amount,
      tax_amount: tax_amount ?? this.tax_amount,
      note: note ?? this.note,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'totalAmount': totalAmount,
      'currency': currency,
      'status': status,
      'customer_id': customer_id,
      'vendor_id': vendor_id,
      'service_id': service_id,
      'event_id': event_id,
      'order_date': order_date?.millisecondsSinceEpoch,
      'shipping_address': shipping_address,
      'billing_address': billing_address,
      'discount_amount': discount_amount,
      'tax_amount': tax_amount,
      'note': note,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] != null ? map['id'] as int : null,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      totalAmount: map['totalAmount'] != null ? map['totalAmount'] as double : null,
      currency: map['currency'] ,
      status:map['status'],
      customer_id: map['customer_id'] as int,
      vendor_id: map['vendor_id'] as int,
      service_id: map['service_id'] as int,
      event_id: map['event_id'] as int,
      order_date: map['order_date'] != null ? DateTime.parse(map['order_date'] as String) : null,
      shipping_address: map['shipping_address'] != null ? map['shipping_address'] as String : null,
      billing_address: map['billing_address'] != null ? map['billing_address'] as String : null,
      discount_amount: map['discount_amount'] != null ? map['discount_amount'] as double : null,
      tax_amount: map['tax_amount'] != null ? map['tax_amount'] as double : null,
      note: map['note'] != null ? map['note'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, created_at: $created_at, updated_at: $updated_at, totalAmount: $totalAmount, currency: $currency, status: $status, customer_id: $customer_id, vendor_id: $vendor_id, service_id: $service_id, event_id: $event_id, order_date: $order_date, shipping_address: $shipping_address, billing_address: $billing_address, discount_amount: $discount_amount, tax_amount: $tax_amount, note: $note)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.totalAmount == totalAmount &&
      other.currency == currency &&
      other.status == status &&
      other.customer_id == customer_id &&
      other.vendor_id == vendor_id &&
      other.service_id == service_id &&
      other.event_id == event_id &&
      other.order_date == order_date &&
      other.shipping_address == shipping_address &&
      other.billing_address == billing_address &&
      other.discount_amount == discount_amount &&
      other.tax_amount == tax_amount &&
      other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      totalAmount.hashCode ^
      currency.hashCode ^
      status.hashCode ^
      customer_id.hashCode ^
      vendor_id.hashCode ^
      service_id.hashCode ^
      event_id.hashCode ^
      order_date.hashCode ^
      shipping_address.hashCode ^
      billing_address.hashCode ^
      discount_amount.hashCode ^
      tax_amount.hashCode ^
      note.hashCode;
  }
}
