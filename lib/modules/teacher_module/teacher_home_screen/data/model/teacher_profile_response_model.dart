// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:trop_prof_itfaq/modules/shared_module/shared_models/address_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/badge_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/course_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/file_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/review_model.dart';
import 'package:trop_prof_itfaq/modules/shared_module/shared_models/user_general_information_model.dart';

class TeacherProfileResponseModel {
  String? id;
  String? userStatus;
  bool? isAvailable;
  String? photoUrl;
  UserGeneralInformationModel? generalInformation;
  AddressModel? address;
  AboutMeModel? aboutMe;
  List<FileModel>? documents;
  List<ExperinceModel>? experiences;
  List<CourseModel>? courses;
  List<BadgeModel>? badges;
  List<ReviewModel>? reviews;
  int? totalReviews;
  int? totalRate;
  int? completePercent;
  int? requiredDataPercent;
  TeacherProfileResponseModel({
    this.id,
    this.userStatus,
    this.isAvailable,
    this.photoUrl,
    this.generalInformation,
    this.address,
    this.aboutMe,
    this.documents,
    this.experiences,
    this.courses,
    this.badges,
    this.reviews,
    this.totalReviews,
    this.totalRate,
    this.completePercent,
    this.requiredDataPercent,
  });

  TeacherProfileResponseModel copyWith({
    String? id,
    String? userStatus,
    bool? isAvailable,
    String? photoUrl,
    UserGeneralInformationModel? generalInformation,
    AddressModel? address,
    AboutMeModel? aboutMe,
    List<FileModel>? documents,
    List<ExperinceModel>? experiences,
    List<CourseModel>? courses,
    List<BadgeModel>? badges,
    List<ReviewModel>? reviews,
    int? totalReviews,
    int? totalRate,
    int? completePercent,
    int? requiredDataPercent,
  }) {
    return TeacherProfileResponseModel(
      id: id ?? this.id,
      userStatus: userStatus ?? this.userStatus,
      isAvailable: isAvailable ?? this.isAvailable,
      photoUrl: photoUrl ?? this.photoUrl,
      generalInformation: generalInformation ?? this.generalInformation,
      address: address ?? this.address,
      aboutMe: aboutMe ?? this.aboutMe,
      documents: documents ?? this.documents,
      experiences: experiences ?? this.experiences,
      courses: courses ?? this.courses,
      badges: badges ?? this.badges,
      reviews: reviews ?? this.reviews,
      totalReviews: totalReviews ?? this.totalReviews,
      totalRate: totalRate ?? this.totalRate,
      completePercent: completePercent ?? this.completePercent,
      requiredDataPercent: requiredDataPercent ?? this.requiredDataPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userStatus': userStatus,
      'isAvailable': isAvailable,
      'photoUrl': photoUrl,
      'generalInformation': generalInformation?.toMap(),
      'address': address?.toMap(),
      'aboutMe': aboutMe?.toMap(),
      'documents': documents?.map((x) => x.toMap()).toList(),
      'experiences': experiences?.map((x) => x.toMap()).toList(),
      'courses': courses?.map((x) => x.toMap()).toList(),
      'badges': badges?.map((x) => x.toMap()).toList(),
      'reviews': reviews?.map((x) => x.toMap()).toList(),
      'totalReviews': totalReviews,
      'totalRate': totalRate,
      'completePercent': completePercent,
      'requiredDataPercent': requiredDataPercent,
    };
  }

  factory TeacherProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return TeacherProfileResponseModel(
      id: map['id'] != null ? map['id'] as String : null,
      userStatus:
          map['userStatus'] != null ? map['userStatus'] as String : null,
      isAvailable:
          map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      generalInformation: map['generalInformation'] != null
          ? UserGeneralInformationModel.fromMap(
              map['generalInformation'] as Map<String, dynamic>)
          : null,
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      aboutMe: map['aboutMe'] != null
          ? AboutMeModel.fromMap(map['aboutMe'] as Map<String, dynamic>)
          : null,
      documents: map['documents'] != null
          ? (map['documents'] as List)
              .map<FileModel>((json) => FileModel.fromMap(json))
              .toList()
          : null,
      experiences: map['experiences'] != null
          ? (map['experiences'] as List)
              .map<ExperinceModel>((json) => ExperinceModel.fromMap(json))
              .toList()
          : null,
      courses: map['courses'] != null
          ? (map['courses'] as List)
              .map<CourseModel>((json) => CourseModel.fromMap(json))
              .toList()
          : null,
      badges: map['badges'] != null
          ? (map['badges'] as List)
              .map<BadgeModel>((json) => BadgeModel.fromMap(json))
              .toList()
          : null,
      reviews: map['reviews'] != null
          ? (map['reviews'] as List)
              .map<ReviewModel>((json) => ReviewModel.fromMap(json))
              .toList()
          : null,
      totalReviews:
          map['totalReviews'] != null ? map['totalReviews'] as int : null,
      totalRate: map['totalRate'] != null ? map['totalRate'] as int : null,
      completePercent:
          map['completePercent'] != null ? map['completePercent'] as int : null,
      requiredDataPercent: map['requiredDataPercent'] != null
          ? map['requiredDataPercent'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherProfileResponseModel.fromJson(String source) =>
      TeacherProfileResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TeacherProfileResponseModel(id: $id, userStatus: $userStatus, isAvailable: $isAvailable, photoUrl: $photoUrl, generalInformation: $generalInformation, address: $address, aboutMe: $aboutMe, documents: $documents, experiences: $experiences, courses: $courses, badges: $badges, reviews: $reviews, totalReviews: $totalReviews, totalRate: $totalRate, completePercent: $completePercent, requiredDataPercent: $requiredDataPercent)';
  }

  @override
  bool operator ==(covariant TeacherProfileResponseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userStatus == userStatus &&
        other.isAvailable == isAvailable &&
        other.photoUrl == photoUrl &&
        other.generalInformation == generalInformation &&
        other.address == address &&
        other.aboutMe == aboutMe &&
        listEquals(other.documents, documents) &&
        listEquals(other.experiences, experiences) &&
        listEquals(other.courses, courses) &&
        listEquals(other.badges, badges) &&
        listEquals(other.reviews, reviews) &&
        other.totalReviews == totalReviews &&
        other.totalRate == totalRate &&
        other.completePercent == completePercent &&
        other.requiredDataPercent == requiredDataPercent;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userStatus.hashCode ^
        isAvailable.hashCode ^
        photoUrl.hashCode ^
        generalInformation.hashCode ^
        address.hashCode ^
        aboutMe.hashCode ^
        documents.hashCode ^
        experiences.hashCode ^
        courses.hashCode ^
        badges.hashCode ^
        reviews.hashCode ^
        totalReviews.hashCode ^
        totalRate.hashCode ^
        completePercent.hashCode ^
        requiredDataPercent.hashCode;
  }
}

class AboutMeModel {
  String? aboutMeBio;
  String? aboutMeHeadline;
  AboutMeModel({
    this.aboutMeBio,
    this.aboutMeHeadline,
  });

  AboutMeModel copyWith({
    String? aboutMeBio,
    String? aboutMeHeadline,
  }) {
    return AboutMeModel(
      aboutMeBio: aboutMeBio ?? this.aboutMeBio,
      aboutMeHeadline: aboutMeHeadline ?? this.aboutMeHeadline,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aboutMeBio': aboutMeBio,
      'aboutMeHeadline': aboutMeHeadline,
    };
  }

  factory AboutMeModel.fromMap(Map<String, dynamic> map) {
    return AboutMeModel(
      aboutMeBio:
          map['aboutMeBio'] != null ? map['aboutMeBio'] as String : null,
      aboutMeHeadline: map['aboutMeHeadline'] != null
          ? map['aboutMeHeadline'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutMeModel.fromJson(String source) =>
      AboutMeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AboutMeModel(aboutMeBio: $aboutMeBio, aboutMeHeadline: $aboutMeHeadline)';

  @override
  bool operator ==(covariant AboutMeModel other) {
    if (identical(this, other)) return true;

    return other.aboutMeBio == aboutMeBio &&
        other.aboutMeHeadline == aboutMeHeadline;
  }

  @override
  int get hashCode => aboutMeBio.hashCode ^ aboutMeHeadline.hashCode;
}

class ExperinceModel {
  String? id;
  String? title;
  String? startYear;
  String? endYear;
  String? description;
  String? createdAt;
  String? updatedAt;
  ExperinceModel({
    this.id,
    this.title,
    this.startYear,
    this.endYear,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  ExperinceModel copyWith({
    String? id,
    String? title,
    String? startYear,
    String? endYear,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return ExperinceModel(
      id: id ?? this.id,
      title: title ?? this.title,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'startYear': startYear,
      'endYear': endYear,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ExperinceModel.fromMap(Map<String, dynamic> map) {
    return ExperinceModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      startYear: map['startYear'] != null ? map['startYear'] as String : null,
      endYear: map['endYear'] != null ? map['endYear'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExperinceModel.fromJson(String source) =>
      ExperinceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExperinceModel(id: $id, title: $title, startYear: $startYear, endYear: $endYear, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ExperinceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.startYear == startYear &&
        other.endYear == endYear &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        startYear.hashCode ^
        endYear.hashCode ^
        description.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
