// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FileModel {
  String? id;
  String? name;
  String? type;
  String? fileUrl;
  String? createdAt;
  String? updatedAt;
  FileModel({
    this.id,
    this.name,
    this.type,
    this.fileUrl,
    this.createdAt,
    this.updatedAt,
  });

  FileModel copyWith({
    String? id,
    String? name,
    String? type,
    String? fileUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    return FileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      fileUrl: fileUrl ?? this.fileUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'fileUrl': fileUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory FileModel.fromMap(Map<String, dynamic> map) {
    return FileModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      fileUrl: map['fileUrl'] != null ? map['fileUrl'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FileModel.fromJson(String source) => FileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FileModel(id: $id, name: $name, type: $type, fileUrl: $fileUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant FileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.type == type &&
      other.fileUrl == fileUrl &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      type.hashCode ^
      fileUrl.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
