// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SinhVien {
  String msv;
  String name;
  String address;
  SinhVien({
    required this.msv,
    required this.name,
    required this.address,
  });

  SinhVien copyWith({
    String? msv,
    String? name,
    String? address,
  }) {
    return SinhVien(
      msv: msv ?? this.msv,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'msv': msv,
      'name': name,
      'address': address,
    };
  }

  factory SinhVien.fromMap(Map<String, dynamic> map) {
    return SinhVien(
      msv: map['msv'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SinhVien.fromJson(String source) =>
      SinhVien.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SinhVien(msv: $msv, name: $name, address: $address)';

  @override
  bool operator ==(covariant SinhVien other) {
    if (identical(this, other)) return true;

    return other.msv == msv && other.name == name && other.address == address;
  }

  @override
  int get hashCode => msv.hashCode ^ name.hashCode ^ address.hashCode;
}
