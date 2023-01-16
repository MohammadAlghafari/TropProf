// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpParentRequestModel {
  String email;
  String password;
  String confirmPassword;
  String firstName;
  String lastName;
  String dateOfBirth;
  SignUpParentRequestModel({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
  });

  SignUpParentRequestModel copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
  }) {
    return SignUpParentRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
    };
  }

  factory SignUpParentRequestModel.fromMap(Map<String, dynamic> map) {
    return SignUpParentRequestModel(
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpParentRequestModel.fromJson(String source) => SignUpParentRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpRequestModel(email: $email, password: $password, confirmPassword: $confirmPassword, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(covariant SignUpParentRequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.password == password &&
      other.confirmPassword == confirmPassword &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.dateOfBirth == dateOfBirth;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      dateOfBirth.hashCode;
  }
}
