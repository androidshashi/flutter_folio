// To parse this JSON data, do
//
//     final experienceModel = experienceModelFromJson(jsonString);

import 'dart:convert';

List<ExperienceModel> experienceModelFromJson(String str) =>
    List<ExperienceModel>.from(
        json.decode(str).map((x) => ExperienceModel.fromJson(x)));

String experienceModelToJson(List<ExperienceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExperienceModel {
  String? title;
  String? year;
  String? location;
  String? company;

  ExperienceModel({this.title, this.year, this.location, this.company});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        title: json["title"],
        year: json["year"],
        location: json["location"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "location": location,
        "company": company,
      };
}
