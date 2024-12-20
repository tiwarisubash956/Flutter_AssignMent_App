// ignore_for_file: file_names

import 'package:flutterassignmentapp/Features/Pages/RepoScreen/Data/Model/OwnerModel.dart';

class GistModel {
  final String? description;
  final int commentsCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Owner owner;

  GistModel({
    required this.owner,
    required this.description,
    required this.commentsCount,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  String toString() {
    return 'Gist(  altDescription: $description, commentsCount: $commentsCount,createdAt:$createdAt,updatedAt:$updatedAt,owner:$owner)';
  }

  // Factory method to create a Gist object from JSON
  factory GistModel.fromJson(Map<String, dynamic> json) {
    return GistModel(
      description: json['description'],
      commentsCount: json['comments'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      owner: Owner.fromJson(json['owner']),
    );
  }
}
