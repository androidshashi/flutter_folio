// To parse this JSON data, do
//
//     final aboutMeModel = aboutMeModelFromJson(jsonString);

import 'dart:convert';

AboutMeModel aboutMeModelFromJson(String str) =>
    AboutMeModel.fromJson(json.decode(str));

String aboutMeModelToJson(AboutMeModel data) => json.encode(data.toJson());

class AboutMeModel {
  String? developerName;
  String? email;
  String? contactNo;
  String? linkedIn;
  String? pubDev;
  String? facebook;
  String? github;
  String? myWork;
  String? aboutMe;

  AboutMeModel({
    this.developerName,
    this.email,
    this.contactNo,
    this.linkedIn,
    this.pubDev,
    this.facebook,
    this.github,
    this.myWork,
    this.aboutMe,
  });

  factory AboutMeModel.fromJson(Map<String, dynamic> json) => AboutMeModel(
        developerName: json["developerName"],
        email: json["email"],
        contactNo: json["contactNo"],
        linkedIn: json["linkedIn"],
        pubDev: json["pubDev"],
        facebook: json["facebook"],
        github: json["github"],
        myWork: json["myWork"],
        aboutMe: json["aboutMe"],
      );

  Map<String, dynamic> toJson() => {
        "developerName": developerName,
        "email": email,
        "contactNo": contactNo,
        "linkedIn": linkedIn,
        "pubDev": pubDev,
        "facebook": facebook,
        "github": github,
        "myWork": myWork,
        "aboutMe": aboutMe,
      };
}
