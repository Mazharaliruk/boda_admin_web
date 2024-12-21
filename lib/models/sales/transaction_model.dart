// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:admin_boda/core/enums/payment/transaction_status.dart';

import '../../core/enums/payment/currency.dart';
import '../../core/enums/payment/payment_method.dart';

class TransactionModel {
  int id;
  DateTime created_at;
  DateTime updated_at;
  double? amount;
  Currency currency;
  TransactionStatus status;
  int order;
  int payment_getway;
  DateTime? transaction_date;
  String? getway_response;
  PaymentMethod payment_method;
  int? retry_count;
  TransactionModel({
   required this.id,
    required this.created_at,
    required this.updated_at,
    this.amount,
    required this.currency,
    required this.status,
    required this.order,
    required this.payment_getway,
    this.transaction_date,
    this.getway_response,
    required this.payment_method,
    this.retry_count,
  });


  TransactionModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    double? amount,
    Currency? currency,
    TransactionStatus? status,
    int? order,
    int? payment_getway,
    DateTime? transaction_date,
    String? getway_response,
    PaymentMethod? payment_method,
    int? retry_count,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      order: order ?? this.order,
      payment_getway: payment_getway ?? this.payment_getway,
      transaction_date: transaction_date ?? this.transaction_date,
      getway_response: getway_response ?? this.getway_response,
      payment_method: payment_method ?? this.payment_method,
      retry_count: retry_count ?? this.retry_count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'amount': amount,
      'currency': currency,
      'status': status,
      'order': order,
      'payment_getway': payment_getway,
      'transaction_date': transaction_date?.millisecondsSinceEpoch,
      'getway_response': getway_response,
      'payment_method': payment_method,
      'retry_count': retry_count,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      amount: map['amount'] != null ? map['amount'] as double : null,
      currency: map['currency'],
      status: map['status'] ,
      order: map['order'] as int,
      payment_getway: map['payment_getway'] as int,
      transaction_date: map['transaction_date'] != null ? DateTime.parse(map['transaction_date'] as String) : null,
      getway_response: map['getway_response'] != null ? map['getway_response'] as String : null,
      payment_method:map['payment_method'],
      retry_count: map['retry_count'] != null ? map['retry_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(id: $id, created_at: $created_at, updated_at: $updated_at, amount: $amount, currency: $currency, status: $status, order: $order, payment_getway: $payment_getway, transaction_date: $transaction_date, getway_response: $getway_response, payment_method: $payment_method, retry_count: $retry_count)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.amount == amount &&
      other.currency == currency &&
      other.status == status &&
      other.order == order &&
      other.payment_getway == payment_getway &&
      other.transaction_date == transaction_date &&
      other.getway_response == getway_response &&
      other.payment_method == payment_method &&
      other.retry_count == retry_count;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      amount.hashCode ^
      currency.hashCode ^
      status.hashCode ^
      order.hashCode ^
      payment_getway.hashCode ^
      transaction_date.hashCode ^
      getway_response.hashCode ^
      payment_method.hashCode ^
      retry_count.hashCode;
  }
}
