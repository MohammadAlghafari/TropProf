// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:trop_prof_itfaq/modules/shared_module/shared_models/level_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/subject_model.dart';

class CourseModel {
  String? id;
  SubjectModel? subject;
  LevelModel? level;
  String? price;
  String? description;
  CourseModel({
    this.id,
    this.subject,
    this.level,
    this.price,
    this.description,
  });

  CourseModel copyWith({
    String? id,
    SubjectModel? subject,
    LevelModel? level,
    String? price,
    String? description,
  }) {
    return CourseModel(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      level: level ?? this.level,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subject': subject?.toMap(),
      'level': level?.toMap(),
      'price': price,
      'description': description,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] != null ? map['id'] as String : null,
      subject: map['subject'] != null ? SubjectModel.fromMap(map['subject'] as Map<String,dynamic>) : null,
      level: map['level'] != null ? LevelModel.fromMap(map['level'] as Map<String,dynamic>) : null,
      price: map['price'] != null ? map['price'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) => CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CourseModel(id: $id, subject: $subject, level: $level, price: $price, description: $description)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.subject == subject &&
      other.level == level &&
      other.price == price &&
      other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      subject.hashCode ^
      level.hashCode ^
      price.hashCode ^
      description.hashCode;
  }
}
