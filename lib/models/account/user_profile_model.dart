// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class UserProfileModel {
  int id;
  int user;
  String? profile_picture;
  String? address;
  String name;
  String email;
  String phone;
  DateTime date_of_birth;
  String role;
  DateTime? last_login;
  DateTime created_at;
  DateTime updated_at;
  bool is_active;
  UserProfileModel({
    required this.id,
    required this.user,
    this.profile_picture,
    this.address,
    required this.name,
    required this.email,
    required this.phone,
    required this.date_of_birth,
    required this.role,
    this.last_login,
    required this.created_at,
    required this.updated_at,
    required this.is_active,
  });

  UserProfileModel copyWith({
    int? id,
    int? user,
    String? profile_picture,
    String? address,
    String? name,
    String? email,
    String? phone,
    DateTime? date_of_birth,
    String? role,
    DateTime? last_login,
    DateTime? created_at,
    DateTime? updated_at,
    bool? is_active,
  }) {
    return UserProfileModel(
      id: id ?? this.id,
      user: user ?? this.user,
      profile_picture: profile_picture ?? this.profile_picture,
      address: address ?? this.address,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      role: role ?? this.role,
      last_login: last_login ?? this.last_login,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'profile_picture': profile_picture,
      'address': address,
      'name': name,
      'email': email,
      'phone': phone,
      'date_of_birth': date_of_birth.millisecondsSinceEpoch,
      'role': role,
      'last_login': last_login?.millisecondsSinceEpoch,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
      'is_active': is_active,
    };
  }

  factory UserProfileModel.fromMap(Map<String, dynamic> map) {
    return UserProfileModel(
      id: map['id'] as int,
      user: map['user'] as int,
      profile_picture: map['profile_picture'] != null ? map['profile_picture'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      date_of_birth: DateTime.parse(map['date_of_birth'] as String),
      role: map['role'] as String,
      last_login: map['last_login'] != null ? DateTime.parse(map['last_login'] as String) : null,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
      is_active: map['is_active'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileModel.fromJson(String source) => UserProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfileModel(id: $id, user: $user, profile_picture: $profile_picture, address: $address, name: $name, email: $email, phone: $phone, date_of_birth: $date_of_birth, role: $role, last_login: $last_login, created_at: $created_at, updated_at: $updated_at, is_active: $is_active)';
  }

  @override
  bool operator ==(covariant UserProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user == user &&
      other.profile_picture == profile_picture &&
      other.address == address &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.date_of_birth == date_of_birth &&
      other.role == role &&
      other.last_login == last_login &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.is_active == is_active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user.hashCode ^
      profile_picture.hashCode ^
      address.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      date_of_birth.hashCode ^
      role.hashCode ^
      last_login.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      is_active.hashCode;
  }
}
