// ignore_for_file: file_names

import 'dart:convert';

class ImageModel {
  final String id;
  final String url;
  final String description;

  ImageModel({required this.id, required this.url, required this.description});

  @override
  String toString() {
    return 'ImageModel(id: $id,  altDescription: $description, imageUrl: $url)';
  }

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? "",
      url: json['urls']['raw'] ?? "",
      description: json['description'] ?? 'No Description',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'description': description,
      };
}

List<ImageModel> imageModelFromJson(String str) {
  final List<dynamic> jsonData = json.decode(str);
  return jsonData.map((item) => ImageModel.fromJson(item)).toList();
}

/// Convert List<ImageModel> to JSON string
String imageModelToJson(List<ImageModel> data) {
  final List<Map<String, dynamic>> jsonData = data.map((item) => item.toJson()).toList();
  return json.encode(jsonData);
}
