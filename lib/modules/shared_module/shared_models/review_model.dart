// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:trop_prof_itfaq/modules/shared_module/shared_models/course_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/user_general_information_model.dart';

class ReviewModel {
  String? id;
  String? review;
  int? rate;
  RatingStudentModel? student;
  CourseModel? course;
  ReviewModel({
    this.id,
    this.review,
    this.rate,
    this.student,
    this.course,
  });

  ReviewModel copyWith({
    String? id,
    String? review,
    int? rate,
    RatingStudentModel? student,
    CourseModel? course,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      review: review ?? this.review,
      rate: rate ?? this.rate,
      student: student ?? this.student,
      course: course ?? this.course,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'review': review,
      'rate': rate,
      'student': student?.toMap(),
      'course': course?.toMap(),
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      id: map['id'] != null ? map['id'] as String : null,
      review: map['review'] != null ? map['review'] as String : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
      student: map['student'] != null ? RatingStudentModel.fromMap(map['student'] as Map<String,dynamic>) : null,
      course: map['course'] != null ? CourseModel.fromMap(map['course'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReviewModel.fromJson(String source) => ReviewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReviewModel(id: $id, review: $review, rate: $rate, student: $student, course: $course)';
  }

  @override
  bool operator ==(covariant ReviewModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.review == review &&
      other.rate == rate &&
      other.student == student &&
      other.course == course;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      review.hashCode ^
      rate.hashCode ^
      student.hashCode ^
      course.hashCode;
  }
}

class RatingStudentModel {
  String? id;
  String? photoUrl;
  UserGeneralInformationModel? generalInformation;
  LevelModel? level;
  RatingStudentModel({
    this.id,
    this.photoUrl,
    this.generalInformation,
    this.level,
  });

  RatingStudentModel copyWith({
    String? id,
    String? photoUrl,
    UserGeneralInformationModel? generalInformation,
    LevelModel? level,
  }) {
    return RatingStudentModel(
      id: id ?? this.id,
      photoUrl: photoUrl ?? this.photoUrl,
      generalInformation: generalInformation ?? this.generalInformation,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'photoUrl': photoUrl,
      'generalInformation': generalInformation?.toMap(),
      'level': level?.toMap(),
    };
  }

  factory RatingStudentModel.fromMap(Map<String, dynamic> map) {
    return RatingStudentModel(
      id: map['id'] != null ? map['id'] as String : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      generalInformation: map['generalInformation'] != null
          ? UserGeneralInformationModel.fromMap(
              map['generalInformation'] as Map<String, dynamic>)
          : null,
      level: map['level'] != null
          ? LevelModel.fromMap(map['level'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingStudentModel.fromJson(String source) =>
      RatingStudentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RatingStudentModel(id: $id, photoUrl: $photoUrl, generalInformation: $generalInformation, level: $level)';
  }

  @override
  bool operator ==(covariant RatingStudentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.photoUrl == photoUrl &&
        other.generalInformation == generalInformation &&
        other.level == level;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        photoUrl.hashCode ^
        generalInformation.hashCode ^
        level.hashCode;
  }
}
