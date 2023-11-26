// To parse this JSON data, do
//
//     final skillsModel = skillsModelFromJson(jsonString);

import 'dart:convert';

SkillsModel skillsModelFromJson(String str) =>
    SkillsModel.fromJson(json.decode(str));

String skillsModelToJson(SkillsModel data) => json.encode(data.toJson());

class SkillsModel {
  List<String>? skills;

  SkillsModel({
    this.skills,
  });

  factory SkillsModel.fromJson(Map<String, dynamic> json) => SkillsModel(
        skills: json["skills"] == null
            ? []
            : List<String>.from(json["skills"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "skills":
            skills == null ? [] : List<dynamic>.from(skills!.map((x) => x)),
      };
}
