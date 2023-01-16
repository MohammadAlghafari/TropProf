import 'dart:convert';

class UserGeneralInformationModel {
  String? email;
  String? fullName;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? phoneNumber;
  String? stripeCustomerId;
  int? wallet;
  UserGeneralInformationModel({
    this.email,
    this.fullName,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.phoneNumber,
    this.stripeCustomerId,
    this.wallet,
  });

  UserGeneralInformationModel copyWith({
    String? email,
    String? fullName,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? phoneNumber,
    String? stripeCustomerId,
    int? wallet,
  }) {
    return UserGeneralInformationModel(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      stripeCustomerId: stripeCustomerId ?? this.stripeCustomerId,
      wallet: wallet ?? this.wallet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'stripeCustomerId': stripeCustomerId,
      'wallet': wallet,
    };
  }

  factory UserGeneralInformationModel.fromMap(Map<String, dynamic> map) {
    return UserGeneralInformationModel(
      email: map['email'] != null ? map['email'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      dateOfBirth:
          map['dateOfBirth'] != null ? map['dateOfBirth'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      stripeCustomerId: map['stripeCustomerId'] != null
          ? map['stripeCustomerId'] as String
          : null,
      wallet: map['wallet'] != null ? map['wallet'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserGeneralInformationModel.fromJson(String source) =>
      UserGeneralInformationModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherGeneralInformation(email: $email, fullName: $fullName, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, phoneNumber: $phoneNumber, stripeCustomerId: $stripeCustomerId, wallet: $wallet)';
  }

  @override
  bool operator ==(covariant UserGeneralInformationModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.fullName == fullName &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.phoneNumber == phoneNumber &&
        other.stripeCustomerId == stripeCustomerId &&
        other.wallet == wallet;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        fullName.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode ^
        phoneNumber.hashCode ^
        stripeCustomerId.hashCode ^
        wallet.hashCode;
  }
}