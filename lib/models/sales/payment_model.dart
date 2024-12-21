// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:admin_boda/core/enums/payment/order_status.dart';

import '../../core/enums/payment/currency.dart';
import '../../core/enums/payment/payment_method.dart';

class PaymentModel {
  int id;
  DateTime created_at;
  DateTime updated_at;
  double amount;
  DateTime? payment_data;
  Currency currency;
  OrderStatus status;
  int order;
  int payment_getway;
  int transaction;
  String? getway_response;
  PaymentMethod payment_method;
  double? refun_amount;
  PaymentModel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.amount,
    this.payment_data,
    required this.currency,
    required this.status,
    required this.order,
    required this.payment_getway,
    required this.transaction,
    this.getway_response,
    required this.payment_method,
    this.refun_amount,
  });


  PaymentModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    double? amount,
    DateTime? payment_data,
    Currency? currency,
    OrderStatus? status,
    int? order,
    int? payment_getway,
    int? transaction,
    String? getway_response,
    PaymentMethod? payment_method,
    double? refun_amount,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      amount: amount ?? this.amount,
      payment_data: payment_data ?? this.payment_data,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      order: order ?? this.order,
      payment_getway: payment_getway ?? this.payment_getway,
      transaction: transaction ?? this.transaction,
      getway_response: getway_response ?? this.getway_response,
      payment_method: payment_method ?? this.payment_method,
      refun_amount: refun_amount ?? this.refun_amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'amount': amount,
      'payment_data': payment_data?.millisecondsSinceEpoch,
      'currency': currency,
      'status': status,
      'order': order,
      'payment_getway': payment_getway,
      'transaction': transaction,
      'getway_response': getway_response,
      'payment_method': payment_method,
      'refun_amount': refun_amount,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      amount: map['amount'] as double,
      payment_data: map['payment_data'] != null ? DateTime.parse(map['payment_data'] as String) : null,
      currency: map['currency'] ,
      status: map['status'] ,
      order: map['order'] as int,
      payment_getway: map['payment_getway'] as int,
      transaction: map['transaction'] as int,
      getway_response: map['getway_response'] != null ? map['getway_response'] as String : null,
      payment_method: map['payment_method'],
      refun_amount: map['refun_amount'] != null ? map['refun_amount'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) => PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(id: $id, created_at: $created_at, updated_at: $updated_at, amount: $amount, payment_data: $payment_data, currency: $currency, status: $status, order: $order, payment_getway: $payment_getway, transaction: $transaction, getway_response: $getway_response, payment_method: $payment_method, refun_amount: $refun_amount)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.amount == amount &&
      other.payment_data == payment_data &&
      other.currency == currency &&
      other.status == status &&
      other.order == order &&
      other.payment_getway == payment_getway &&
      other.transaction == transaction &&
      other.getway_response == getway_response &&
      other.payment_method == payment_method &&
      other.refun_amount == refun_amount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      amount.hashCode ^
      payment_data.hashCode ^
      currency.hashCode ^
      status.hashCode ^
      order.hashCode ^
      payment_getway.hashCode ^
      transaction.hashCode ^
      getway_response.hashCode ^
      payment_method.hashCode ^
      refun_amount.hashCode;
  }
}
