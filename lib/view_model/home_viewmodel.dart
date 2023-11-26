import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_folio/constants/app_localization.dart';
import 'package:flutter_folio/model/about_me_model.dart';
import 'package:flutter_folio/model/experience_model.dart';
import 'package:flutter_folio/model/project_model.dart';
import 'package:flutter_folio/model/skills_model.dart';
import 'package:flutter_folio/utils/utils.dart';

class HomeViewModel extends ChangeNotifier {
  List<ProjectModel> myProjects = [];
  List<String> mySkills = [];
  List<ExperienceModel> myExperience = [];
  AboutMeModel? aboutMeModel;

  Future<void> fetchMyProjects(BuildContext context) async {
    if (myProjects.isNotEmpty) return;
    try {
      final String response = await rootBundle.loadString(projectsJson);
      myProjects = projectModelFromJson(response);
      notifyListeners();
    } on IOException catch (e) {
      showSnackBar(context: context, content: e.toString(), success: false);
    }
  }

  Future<void> fetchMySkills(BuildContext context) async {
    if (mySkills.isNotEmpty) return;
    try {
      final String response = await rootBundle.loadString(skillsJson);
      mySkills = skillsModelFromJson(response).skills ?? [];
      notifyListeners();
    } on IOException catch (e) {
      showSnackBar(context: context, content: e.toString(), success: false);
    }
  }

  Future<void> fetchAboutMe(BuildContext context) async {
    if (aboutMeModel != null) return;
    try {
      final String response = await rootBundle.loadString(aboutMeJson);
      aboutMeModel = aboutMeModelFromJson(response);
      notifyListeners();
    } on IOException catch (e) {
      showSnackBar(context: context, content: e.toString(), success: false);
    }
  }

  Future<void> fetchExperience(BuildContext context) async {
    if (myExperience.isNotEmpty) return;
    try {
      final String response = await rootBundle.loadString(experienceJson);
      myExperience = experienceModelFromJson(response);
      notifyListeners();
    } on IOException catch (e) {
      showSnackBar(context: context, content: e.toString(), success: false);
    }
  }
}
