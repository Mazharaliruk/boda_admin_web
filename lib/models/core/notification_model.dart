// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class NotificationModel {
  int id;
  String title;
  String? message;
  DateTime created_at;
  DateTime updated_at;
  bool is_read;
  int user;
  NotificationModel({
    required this.id,
    required this.title,
    this.message,
    required this.created_at,
    required this.updated_at,
    required this.is_read,
    required this.user,
  });


  NotificationModel copyWith({
    int? id,
    String? title,
    String? message,
    DateTime? created_at,
    DateTime? updated_at,
    bool? is_read,
    int? user,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      is_read: is_read ?? this.is_read,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'message': message,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'is_read': is_read,
      'user': user,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as int,
      title: map['title'] as String,
      message: map['message'] != null ? map['message'] as String : null,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      is_read: map['is_read'] as bool,
      user: map['user'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) => NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, message: $message, created_at: $created_at, updated_at: $updated_at, is_read: $is_read, user: $user)';
  }

  @override
  bool operator ==(covariant NotificationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.message == message &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.is_read == is_read &&
      other.user == user;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      message.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      is_read.hashCode ^
      user.hashCode;
  }
}
