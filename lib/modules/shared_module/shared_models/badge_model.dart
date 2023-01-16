// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:trop_prof_itfaq/modules/shared_module/shared_models/course_model.dart';

class BadgeModel {
  String? id;
  String? name;
  String? thumbnail;
  CourseModel? course;
  BadgeModel({
    this.id,
    this.name,
    this.thumbnail,
    this.course,
  });

  BadgeModel copyWith({
    String? id,
    String? name,
    String? thumbnail,
    CourseModel? course,
  }) {
    return BadgeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      thumbnail: thumbnail ?? this.thumbnail,
      course: course ?? this.course,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
      'course': course?.toMap(),
    };
  }

  factory BadgeModel.fromMap(Map<String, dynamic> map) {
    return BadgeModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      course: map['course'] != null ? CourseModel.fromMap(map['course'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BadgeModel.fromJson(String source) => BadgeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BadgeModel(id: $id, name: $name, thumbnail: $thumbnail, course: $course)';
  }

  @override
  bool operator ==(covariant BadgeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.thumbnail == thumbnail &&
      other.course == course;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      thumbnail.hashCode ^
      course.hashCode;
  }
}
