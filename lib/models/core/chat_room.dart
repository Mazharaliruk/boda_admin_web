// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:admin_boda/core/enums/core/room_status.dart';
import 'package:admin_boda/core/enums/core/room_type.dart';

class ChatRoom {
  int id;
DateTime created_at;
DateTime updated_at;
int user_id1;
int user_id2;
int admin_id;
RoomStatus room_status;
RoomType room_type;
  ChatRoom({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.user_id1,
    required this.user_id2,
    required this.admin_id,
    required this.room_status,
    required this.room_type,
  });

  ChatRoom copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    int? user_id1,
    int? user_id2,
    int? admin_id,
    RoomStatus? room_status,
    RoomType? room_type,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      user_id1: user_id1 ?? this.user_id1,
      user_id2: user_id2 ?? this.user_id2,
      admin_id: admin_id ?? this.admin_id,
      room_status: room_status ?? this.room_status,
      room_type: room_type ?? this.room_type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'user_id1': user_id1,
      'user_id2': user_id2,
      'admin_id': admin_id,
      'room_status': room_status,
      'room_type': room_type,
    };
  }

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map['id'] as int,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      user_id1: map['user_id1'] as int,
      user_id2: map['user_id2'] as int,
      admin_id: map['admin_id'] as int,
      room_status: RoomStatus.values.firstWhere((element) => element.name == map['room_status']),
      room_type: RoomType.values.firstWhere((element) => element.name == map['room_type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRoom.fromJson(String source) => ChatRoom.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatRoom(id: $id, created_at: $created_at, updated_at: $updated_at, user_id1: $user_id1, user_id2: $user_id2, admin_id: $admin_id, room_status: $room_status, room_type: $room_type)';
  }

  @override
  bool operator ==(covariant ChatRoom other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.user_id1 == user_id1 &&
      other.user_id2 == user_id2 &&
      other.admin_id == admin_id &&
      other.room_status == room_status &&
      other.room_type == room_type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      user_id1.hashCode ^
      user_id2.hashCode ^
      admin_id.hashCode ^
      room_status.hashCode ^
      room_type.hashCode;
  }
}
