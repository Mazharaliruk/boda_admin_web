// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:admin_boda/core/enums/core/delivery_status.dart';
import 'package:admin_boda/core/enums/core/message_type.dart';

class MessageModel {
  int id;
  DateTime created_at;
  DateTime updated_at;
  int? room;
  int sender_id;
  int? receiver_id;
  String? message_content;
  MessageType message_type;
  String? attachment_url;
  DateTime sent_at;
  DateTime? read_at;
  bool is_read;
  bool is_deleted;
  int? parent_message;
  bool is_urgent;
  DeliveryStatus delivery_status;
  MessageModel({
    required this.id,
    required this.created_at,
    required this.updated_at,
    this.room,
    required this.sender_id,
    this.receiver_id,
    this.message_content,
    required this.message_type,
    this.attachment_url,
    required this.sent_at,
    this.read_at,
    required this.is_read,
    required this.is_deleted,
    this.parent_message,
    required this.is_urgent,
    required this.delivery_status,
  });

  MessageModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    int? room,
    int? sender_id,
    int? receiver_id,
    String? message_content,
    MessageType? message_type,
    String? attachment_url,
    DateTime? sent_at,
    DateTime? read_at,
    bool? is_read,
    bool? is_deleted,
    int? parent_message,
    bool? is_urgent,
    DeliveryStatus? delivery_status,
  }) {
    return MessageModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      room: room ?? this.room,
      sender_id: sender_id ?? this.sender_id,
      receiver_id: receiver_id ?? this.receiver_id,
      message_content: message_content ?? this.message_content,
      message_type: message_type ?? this.message_type,
      attachment_url: attachment_url ?? this.attachment_url,
      sent_at: sent_at ?? this.sent_at,
      read_at: read_at ?? this.read_at,
      is_read: is_read ?? this.is_read,
      is_deleted: is_deleted ?? this.is_deleted,
      parent_message: parent_message ?? this.parent_message,
      is_urgent: is_urgent ?? this.is_urgent,
      delivery_status: delivery_status ?? this.delivery_status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'room': room,
      'sender_id': sender_id,
      'receiver_id': receiver_id,
      'message_content': message_content,
      'message_type': message_type,
      'attachment_url': attachment_url,
      'sent_at': sent_at.millisecondsSinceEpoch,
      'read_at': read_at?.millisecondsSinceEpoch,
      'is_read': is_read,
      'is_deleted': is_deleted,
      'parent_message': parent_message,
      'is_urgent': is_urgent,
      'delivery_status': delivery_status,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      room: map['room'] != null ? map['room'] as int : null,
      sender_id: map['sender_id'] as int,
      receiver_id: map['receiver_id'] != null ? map['receiver_id'] as int : null,
      message_content: map['message_content'] != null ? map['message_content'] as String : null,
      message_type: MessageType.values.firstWhere((element) => element.name == map['message_type']),
      attachment_url: map['attachment_url'] != null ? map['attachment_url'] as String : null,
      sent_at: DateTime.parse(map['sent_at'] as String),
      read_at: map['read_at'] != null ? DateTime.parse(map['read_at'] as String) : null,
      is_read: map['is_read'] as bool,
      is_deleted: map['is_deleted'] as bool,
      parent_message: map['parent_message'] != null ? map['parent_message'] as int : null,
      is_urgent: map['is_urgent'] as bool,
      delivery_status: DeliveryStatus.values.firstWhere((element) => element.name == map['delivery_status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(id: $id, created_at: $created_at, updated_at: $updated_at, room: $room, sender_id: $sender_id, receiver_id: $receiver_id, message_content: $message_content, message_type: $message_type, attachment_url: $attachment_url, sent_at: $sent_at, read_at: $read_at, is_read: $is_read, is_deleted: $is_deleted, parent_message: $parent_message, is_urgent: $is_urgent, delivery_status: $delivery_status)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.room == room &&
      other.sender_id == sender_id &&
      other.receiver_id == receiver_id &&
      other.message_content == message_content &&
      other.message_type == message_type &&
      other.attachment_url == attachment_url &&
      other.sent_at == sent_at &&
      other.read_at == read_at &&
      other.is_read == is_read &&
      other.is_deleted == is_deleted &&
      other.parent_message == parent_message &&
      other.is_urgent == is_urgent &&
      other.delivery_status == delivery_status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      room.hashCode ^
      sender_id.hashCode ^
      receiver_id.hashCode ^
      message_content.hashCode ^
      message_type.hashCode ^
      attachment_url.hashCode ^
      sent_at.hashCode ^
      read_at.hashCode ^
      is_read.hashCode ^
      is_deleted.hashCode ^
      parent_message.hashCode ^
      is_urgent.hashCode ^
      delivery_status.hashCode;
  }
}
