// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: non_constant_identifier_names
class TodoModel {
  String? id;
  final String names;
  final String description;
  final Timestamp createdAt;
  TodoModel({
    required this.names,
    required this.description,
    required this.createdAt,
    this.id,
  });

  TodoModel copyWith({
    String? id,
    String? names,
    String? description,
    Timestamp? createdAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      names: names ?? this.names,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'names': names,
      'description': description,
      'createdAt': createdAt,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      names: map['names'] as String,
      description: map['description'] as String,
      createdAt: Timestamp.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        names: json["names"],
        description: json["description"],
        createdAt: json["createdAt"],
      );
  @override
  String toString() =>
      'TodoModel(id: $id, names: $names, description: $description,createdAt: $createdAt)';
}
