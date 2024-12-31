// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class TaxModel {
  int id;
  String name;
  DateTime created_at;
  DateTime updated_at;
  int service_id;
  bool is_active;
  double? tax_percent;
  DateTime? start_date;
  DateTime? end_date;
  String? description;
  TaxModel({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.service_id,
    required this.is_active,
    this.tax_percent,
    this.start_date,
    this.end_date,
    this.description,
  });


  TaxModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    int? service_id,
    bool? is_active,
    double? tax_percent,
    DateTime? start_date,
    DateTime? end_date,
    String? description,
  }) {
    return TaxModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      service_id: service_id ?? this.service_id,
      is_active: is_active ?? this.is_active,
      tax_percent: tax_percent ?? this.tax_percent,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'service_id': service_id,
      'is_active': is_active,
      'tax_percent': tax_percent,
      'start_date': start_date?.millisecondsSinceEpoch,
      'end_date': end_date?.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory TaxModel.fromMap(Map<String, dynamic> map) {
    return TaxModel(
      id: map['id'] as int,
      name: map['name'] as String,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      service_id: map['service_id'] as int,
      is_active: map['is_active'] as bool,
      tax_percent: map['tax_percent'] != null ? map['tax_percent'] as double : null,
      start_date: map['start_date'] != null ? DateTime.parse(map['start_date'] as String) : null,
      end_date: map['end_date'] != null ? DateTime.parse(map['end_date'] as String) : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaxModel.fromJson(String source) => TaxModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaxModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, service_id: $service_id, is_active: $is_active, tax_percent: $tax_percent, start_date: $start_date, end_date: $end_date, description: $description)';
  }

  @override
  bool operator ==(covariant TaxModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.service_id == service_id &&
      other.is_active == is_active &&
      other.tax_percent == tax_percent &&
      other.start_date == start_date &&
      other.end_date == end_date &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      service_id.hashCode ^
      is_active.hashCode ^
      tax_percent.hashCode ^
      start_date.hashCode ^
      end_date.hashCode ^
      description.hashCode;
  }
}
