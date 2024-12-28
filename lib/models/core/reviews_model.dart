// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ReviewsModel {
  int id;
  DateTime created_at;
  DateTime updated_at;
  int user;
  int? service;
  int? event;
  int? vendor;
  double rating;
  String? comment;
  ReviewsModel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.user,
    this.service,
    this.event,
    this.vendor,
    required this.rating,
    this.comment,
  });

  ReviewsModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    int? user,
    int? service,
    int? event,
    int? vendor,
    double? rating,
    String? comment,
  }) {
    return ReviewsModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      user: user ?? this.user,
      service: service ?? this.service,
      event: event ?? this.event,
      vendor: vendor ?? this.vendor,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'user': user,
      'service': service,
      'event': event,
      'vendor': vendor,
      'rating': rating,
      'comment': comment,
    };
  }

  factory ReviewsModel.fromMap(Map<String, dynamic> map) {
    return ReviewsModel(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      user: map['user'] as int,
      service: map['service'] != null ? map['service'] as int : null,
      event: map['event'] != null ? map['event'] as int : null,
      vendor: map['vendor'] != null ? map['vendor'] as int : null,
      rating: map['rating'] as double,
      comment: map['comment'] != null ? map['comment'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewsModel.fromJson(String source) => ReviewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewsModel(id: $id, created_at: $created_at, updated_at: $updated_at, user: $user, service: $service, event: $event, vendor: $vendor, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(covariant ReviewsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.user == user &&
      other.service == service &&
      other.event == event &&
      other.vendor == vendor &&
      other.rating == rating &&
      other.comment == comment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      user.hashCode ^
      service.hashCode ^
      event.hashCode ^
      vendor.hashCode ^
      rating.hashCode ^
      comment.hashCode;
  }
}
