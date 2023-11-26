// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

List<ProjectModel> projectModelFromJson(String str) => List<ProjectModel>.from(
    json.decode(str).map((x) => ProjectModel.fromJson(x)));

String projectModelToJson(List<ProjectModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectModel {
  String? name;
  String? description;
  String? image;
  String? github;

  ProjectModel({
    this.name,
    this.description,
    this.image,
    this.github,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        github: json["github"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "github": github,
      };
}
