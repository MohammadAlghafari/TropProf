// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentProfileResponseModel {
  String? id;
  StudentProfileResponseModel({
    this.id,
  });

  StudentProfileResponseModel copyWith({
    String? id,
  }) {
    return StudentProfileResponseModel(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory StudentProfileResponseModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileResponseModel(
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileResponseModel.fromJson(String source) => StudentProfileResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StudentProfileResponseModel(id: $id)';

  @override
  bool operator ==(covariant StudentProfileResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
