// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

// class Signup for request
class SignUpTeacherRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String dateOfBirth;
  final String password;
  final String confirmPassword;
  final List<TeacherCourse> coursesWith;
  SignUpTeacherRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.dateOfBirth,
    required this.password,
    required this.confirmPassword,
    required this.coursesWith,
  });
  

  SignUpTeacherRequestModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? dateOfBirth,
    String? password,
    String? confirmPassword,
    List<TeacherCourse>? coursesWith,
  }) {
    return SignUpTeacherRequestModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      coursesWith: coursesWith ?? this.coursesWith,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'password': password,
      'confirmPassword': confirmPassword,
      'coursesWith': coursesWith.map((x) => x.toMap()).toList(),
    };
  }

  factory SignUpTeacherRequestModel.fromMap(Map<String, dynamic> map) {
    return SignUpTeacherRequestModel(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] as String,
      coursesWith: List<TeacherCourse>.from((map['coursesWith'] as List<int>).map<TeacherCourse>((x) => TeacherCourse.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpTeacherRequestModel.fromJson(String source) => SignUpTeacherRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpTeacherRequestModel(firstName: $firstName, lastName: $lastName, email: $email, dateOfBirth: $dateOfBirth, password: $password, confirmPassword: $confirmPassword, coursesWith: $coursesWith)';
  }

  @override
  bool operator ==(covariant SignUpTeacherRequestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.dateOfBirth == dateOfBirth &&
      other.password == password &&
      other.confirmPassword == confirmPassword &&
      listEquals(other.coursesWith, coursesWith);
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      dateOfBirth.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode ^
      coursesWith.hashCode;
  }
}

class TeacherCourse {
  String subjectId;
  List<String> levelsIds;
  TeacherCourse({
    required this.subjectId,
    required this.levelsIds,
  });

  TeacherCourse copyWith({
    String? subjectId,
    List<String>? levelsIds,
  }) {
    return TeacherCourse(
      subjectId: subjectId ?? this.subjectId,
      levelsIds: levelsIds ?? this.levelsIds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectId': subjectId,
      'levelsIds': levelsIds,
    };
  }

  factory TeacherCourse.fromMap(Map<String, dynamic> map) {
    return TeacherCourse(
      subjectId: map['subjectId'] as String,
      levelsIds: List<String>.from(
        (map['levelsIds'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherCourse.fromJson(String source) =>
      TeacherCourse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TeacherCourse(subjectId: $subjectId, levelsIds: $levelsIds)';

  @override
  bool operator ==(covariant TeacherCourse other) {
    if (identical(this, other)) return true;

    return other.subjectId == subjectId &&
        listEquals(other.levelsIds, levelsIds);
  }

  @override
  int get hashCode => subjectId.hashCode ^ levelsIds.hashCode;
}
