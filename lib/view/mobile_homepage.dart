import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/mobile_project_widget.dart';
import 'package:flutter_folio/common_widgets/my_skills.dart';
import 'package:flutter_folio/common_widgets/my_timeline.dart';
import 'package:flutter_folio/common_widgets/name_info_container.dart';
import 'package:flutter_folio/common_widgets/profile_picture.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_localization.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/model/project_model.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: constraints.maxWidth * 0.01,
            horizontal: constraints.maxWidth * 0.10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTopRow(context),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            Divider(
              color: AppColor.onPrimary.withOpacity(0.1),
            ),
            Text(
              AppLocalization.experience,
              style: subHeadingTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            const MyTimeLine(),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            Text(
              AppLocalization.mySkills,
              style: subHeadingTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            const MySkills(),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            Text(
              AppLocalization.myProjects,
              style: subHeadingTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: constraints.maxWidth * 0.05,
            ),
            _getMobileProjects(),
          ],
        ),
      ),
    );
  }

  Widget _getMobileProjects() {
    return Selector<HomeViewModel, List<ProjectModel>>(
      builder: (context, projectList, child) => SizedBox(
        height: Dimen.getCurrentWidth(context) * 0.8 * projectList.length,
        child: ListView.separated(
            physics: Dimen.isMobile(context)
                ? const NeverScrollableScrollPhysics()
                : null,
            itemBuilder: (context, index) => MobileProjectWidget(
                  imageUrl: projectList[index].image!,
                  title: projectList[index].name!,
                  description: projectList[index].description!,
                  githubUrl: projectList[index].github!,
                  tools: projectList[index].tools!,
                  platform: projectList[index].platform!,
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: projectList.length),
      ),
      selector: (p0, p1) => p1.myProjects,
    );
  }

  Container _buildTopRow(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          ProfilePicture(),
          SizedBox(height: 10),
          NameInfoContainer(),
        ],
      ),
    );
  }
}
