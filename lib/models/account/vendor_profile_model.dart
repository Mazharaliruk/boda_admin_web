// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class VendorProfileModel {
  int id;
  int user;
  String? profile_picture;
  String? address;
  String? business_type;
  String? business_name;
  String name;
  String email;
  String phone;
  DateTime date_of_birth;
  String role;
  bool is_active;
  DateTime? last_login;
  DateTime created_at;
  DateTime updated_at;
  VendorProfileModel({
    required this.id,
    required this.user,
    this.profile_picture,
    this.address,
    this.business_type,
    this.business_name,
    required this.name,
    required this.email,
    required this.phone,
    required this.date_of_birth,
    required this.role,
    required this.is_active,
    this.last_login,
    required this.created_at,
    required this.updated_at,
  });


  VendorProfileModel copyWith({
    int? id,
    int? user,
    String? profile_picture,
    String? address,
    String? business_type,
    String? business_name,
    String? name,
    String? email,
    String? phone,
    DateTime? date_of_birth,
    String? role,
    bool? is_active,
    DateTime? last_login,
    DateTime? created_at,
    DateTime? updated_at,
  }) {
    return VendorProfileModel(
      id: id ?? this.id,
      user: user ?? this.user,
      profile_picture: profile_picture ?? this.profile_picture,
      address: address ?? this.address,
      business_type: business_type ?? this.business_type,
      business_name: business_name ?? this.business_name,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      date_of_birth: date_of_birth ?? this.date_of_birth,
      role: role ?? this.role,
      is_active: is_active ?? this.is_active,
      last_login: last_login ?? this.last_login,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'profile_picture': profile_picture,
      'address': address,
      'business_type': business_type,
      'business_name': business_name,
      'name': name,
      'email': email,
      'phone': phone,
      'date_of_birth': date_of_birth.millisecondsSinceEpoch,
      'role': role,
      'is_active': is_active,
      'last_login': last_login?.millisecondsSinceEpoch,
      'created_at': created_at.millisecondsSinceEpoch,
      'updated_at': updated_at.millisecondsSinceEpoch,
    };
  }

  factory VendorProfileModel.fromMap(Map<String, dynamic> map) {
    return VendorProfileModel(
      id: map['id'] as int,
      user: map['user'] as int,
      profile_picture: map['profile_picture'] != null ? map['profile_picture'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      business_type: map['business_type'] != null ? map['business_type'] as String : null,
      business_name: map['business_name'] != null ? map['business_name'] as String : null,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      date_of_birth: DateTime.parse(map['date_of_birth'] as String),
      role: map['role'] as String,
      is_active: map['is_active'] as bool,
      last_login: map['last_login'] != null ? DateTime.parse(map['last_login'] as String) : null,
      created_at: DateTime.parse(map['created_at'] as String),
      updated_at: DateTime.parse(map['updated_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorProfileModel.fromJson(String source) => VendorProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VendorProfileModel(id: $id, user: $user, profile_picture: $profile_picture, address: $address, business_type: $business_type, business_name: $business_name, name: $name, email: $email, phone: $phone, date_of_birth: $date_of_birth, role: $role, is_active: $is_active, last_login: $last_login, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant VendorProfileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.user == user &&
      other.profile_picture == profile_picture &&
      other.address == address &&
      other.business_type == business_type &&
      other.business_name == business_name &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.date_of_birth == date_of_birth &&
      other.role == role &&
      other.is_active == is_active &&
      other.last_login == last_login &&
      other.created_at == created_at &&
      other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      user.hashCode ^
      profile_picture.hashCode ^
      address.hashCode ^
      business_type.hashCode ^
      business_name.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      date_of_birth.hashCode ^
      role.hashCode ^
      is_active.hashCode ^
      last_login.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode;
  }
}
