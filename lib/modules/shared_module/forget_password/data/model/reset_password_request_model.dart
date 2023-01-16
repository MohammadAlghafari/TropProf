// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordRequestModel {
  String email;
  int otpCode;
  String newPassword;
  String confirmNewPassword;
  ResetPasswordRequestModel({
    required this.email,
    required this.otpCode,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  ResetPasswordRequestModel copyWith({
    String? email,
    int? otpCode,
    String? newPassword,
    String? confirmNewPassword,
  }) {
    return ResetPasswordRequestModel(
      email: email ?? this.email,
      otpCode: otpCode ?? this.otpCode,
      newPassword: newPassword ?? this.newPassword,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'otpCode': otpCode,
      'newPassword': newPassword,
      'confirmNewPassword': confirmNewPassword,
    };
  }

  factory ResetPasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordRequestModel(
      email: map['email'] as String,
      otpCode: map['otpCode'] as int,
      newPassword: map['newPassword'] as String,
      confirmNewPassword: map['confirmNewPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordRequestModel.fromJson(String source) => ResetPasswordRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResetPasswordRequestModel(email: $email, otpCode: $otpCode, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)';
  }

  @override
  bool operator ==(covariant ResetPasswordRequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.otpCode == otpCode &&
      other.newPassword == newPassword &&
      other.confirmNewPassword == confirmNewPassword;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      otpCode.hashCode ^
      newPassword.hashCode ^
      confirmNewPassword.hashCode;
  }
}
