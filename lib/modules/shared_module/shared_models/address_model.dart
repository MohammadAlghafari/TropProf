// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  String? streetName;
  String? additionalLine;
  String? zipCode;
  String? city;
  String? country;
  AddressModel({
    this.streetName,
    this.additionalLine,
    this.zipCode,
    this.city,
    this.country,
  });

  AddressModel copyWith({
    String? streetName,
    String? additionalLine,
    String? zipCode,
    String? city,
    String? country,
  }) {
    return AddressModel(
      streetName: streetName ?? this.streetName,
      additionalLine: additionalLine ?? this.additionalLine,
      zipCode: zipCode ?? this.zipCode,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'streetName': streetName,
      'additionalLine': additionalLine,
      'zipCode': zipCode,
      'city': city,
      'country': country,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      streetName: map['streetName'] != null ? map['streetName'] as String : null,
      additionalLine: map['additionalLine'] != null ? map['additionalLine'] as String : null,
      zipCode: map['zipCode'] != null ? map['zipCode'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(streetName: $streetName, additionalLine: $additionalLine, zipCode: $zipCode, city: $city, country: $country)';
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.streetName == streetName &&
      other.additionalLine == additionalLine &&
      other.zipCode == zipCode &&
      other.city == city &&
      other.country == country;
  }

  @override
  int get hashCode {
    return streetName.hashCode ^
      additionalLine.hashCode ^
      zipCode.hashCode ^
      city.hashCode ^
      country.hashCode;
  }
}
