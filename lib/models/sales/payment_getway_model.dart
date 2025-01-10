// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin_boda/core/enums/payment/currency.dart';

class PaymentGetwayModel {
  int id;
  DateTime created_at;
  DateTime updated_at;
  String name;
  String? api_key;
  String? secret_key;
  String? base_url;
  bool status;
  double transaction_fee;
  Map<String ,dynamic>? additional_config;
  Currency supported_currency;
  PaymentGetwayModel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.name,
    this.api_key,
    this.secret_key,
    this.base_url,
    required this.status,
    required this.transaction_fee,
    this.additional_config,
    required this.supported_currency,
  });

  PaymentGetwayModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? name,
    String? api_key,
    String? secret_key,
    String? base_url,
    bool? status,
    double? transaction_fee,
    Map<String ,dynamic>? additional_config,
    Currency? supported_currency,
  }) {
    return PaymentGetwayModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      name: name ?? this.name,
      api_key: api_key ?? this.api_key,
      secret_key: secret_key ?? this.secret_key,
      base_url: base_url ?? this.base_url,
      status: status ?? this.status,
      transaction_fee: transaction_fee ?? this.transaction_fee,
      additional_config: additional_config ?? this.additional_config,
      supported_currency: supported_currency ?? this.supported_currency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
      'name': name,
      'api_key': api_key,
      'secret_key': secret_key,
      'base_url': base_url,
      'status': status,
      'transaction_fee': transaction_fee,
      'additional_config': additional_config,
      'supported_currency': supported_currency,
    };
  }

  factory PaymentGetwayModel.fromMap(Map<String, dynamic> map) {
    return PaymentGetwayModel(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      name: map['name'] as String,
      api_key: map['api_key'] != null ? map['api_key'] as String : null,
      secret_key: map['secret_key'] != null ? map['secret_key'] as String : null,
      base_url: map['base_url'] != null ? map['base_url'] as String : null,
      status: map['status'] as bool,
      transaction_fee: map['transaction_fee'] as double,
      additional_config: map['additional_config'] != null ? Map<String ,dynamic>.from((map['additional_config'] as Map<String ,dynamic>)) : null,
      supported_currency: Currency.values.firstWhere((e) => e.name == map['supported_currency']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentGetwayModel.fromJson(String source) =>                                                                                                                                                                                                                                                                                                                                                                                                                                                            
      PaymentGetwayModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentGetwayModel(id: $id, created_at: $created_at, updated_at: $updated_at, name: $name, api_key: $api_key, secret_key: $secret_key, base_url: $base_url, status: $status, transaction_fee: $transaction_fee, additional_config: $additional_config, supported_currency: $supported_currency)';
  }

  @override
  bool operator ==(covariant PaymentGetwayModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.name == name &&
      other.api_key == api_key &&
      other.secret_key == secret_key &&
      other.base_url == base_url &&
      other.status == status &&
      other.transaction_fee == transaction_fee &&
      mapEquals(other.additional_config, additional_config) &&
      other.supported_currency == supported_currency;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        name.hashCode ^
        api_key.hashCode ^
        secret_key.hashCode ^
        base_url.hashCode ^
        status.hashCode ^
        transaction_fee.hashCode ^
        additional_config.hashCode ^
        supported_currency.hashCode;
  }
}
