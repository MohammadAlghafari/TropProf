// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Login Response Model
class LoginResponseModel {
  String accessToken;
  String accessTokenExpirationDate;
  String refreshToken;
  String refreshTokenExpirationDate;
  String type;

  LoginResponseModel({
    required this.accessToken,
    required this.accessTokenExpirationDate,
    required this.refreshToken,
    required this.refreshTokenExpirationDate,
    required this.type,
  });

  LoginResponseModel copyWith({
    String? accessToken,
    String? accessTokenExpirationDate,
    String? refreshToken,
    String? refreshTokenExpirationDate,
    String? type,
  }) {
    return LoginResponseModel(
      accessToken: accessToken ?? this.accessToken,
      accessTokenExpirationDate:
          accessTokenExpirationDate ?? this.accessTokenExpirationDate,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpirationDate:
          refreshTokenExpirationDate ?? this.refreshTokenExpirationDate,
      type: type ?? this.type);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseModel &&
          runtimeType == other.runtimeType &&
          accessToken == other.accessToken &&
          accessTokenExpirationDate == other.accessTokenExpirationDate &&
          refreshToken == other.refreshToken &&
          refreshTokenExpirationDate == other.refreshTokenExpirationDate &&
          type == other.type ;
  @override
  int get hashCode =>
      accessToken.hashCode ^
      accessTokenExpirationDate.hashCode ^
      refreshToken.hashCode ^
      refreshTokenExpirationDate.hashCode ^
      type.hashCode ;
  @override
  String toString() {
    return 'LoginResponseModel{accessToken: $accessToken, accessTokenExpirationDate: $accessTokenExpirationDate, refreshToken: $refreshToken, refreshTokenExpirationDate: $refreshTokenExpirationDate, type: $type}';
  }

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'accessTokenExpirationDate': accessTokenExpirationDate,
      'refreshToken': refreshToken,
      'refreshTokenExpirationDate': refreshTokenExpirationDate,
      'type': type,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      accessToken: map['accessToken'] as String,
      accessTokenExpirationDate: map['accessTokenExpirationDate'] as String,
      refreshToken: map['refreshToken'] as String,
      refreshTokenExpirationDate: map['refreshTokenExpirationDate'] as String,
      type: map['type'] as String,
    );
  }
}
