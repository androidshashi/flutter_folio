import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/desktop_project_widget.dart';
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

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = Dimen.getCurrentWidth(context);
    double height = Dimen.getCurrentWidth(context);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: width * 0.10, horizontal: width * 0.10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopRow(context),
          SizedBox(
            height: width * 0.03,
          ),
          Divider(
            color: AppColor.onPrimary.withOpacity(0.1),
          ),
          SizedBox(
            height: width * 0.03,
          ),
          Text(
            AppLocalization.experience,
            style: subHeadingTxtStyle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
              height: width * 0.6, width: width, child: const MyTimeLine()),
          Text(
            AppLocalization.mySkills,
            style: subHeadingTxtStyle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: width * 0.03,
          ),
          const MySkills(),
          SizedBox(
            height: width * 0.05,
          ),
          Text(
            AppLocalization.myProjects,
            style: subHeadingTxtStyle,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: width * 0.03,
          ),
          SizedBox(
              height: height * 0.6,
              width: double.infinity,
              child: _getDesktopProjects(context)),
          SizedBox(
            height: width * 0.03,
          ),
        ],
      ),
    );
  }

  Widget _getDesktopProjects(BuildContext context) {
    return Selector<HomeViewModel, List<ProjectModel>>(
      builder: (context, projectList, child) => GridView.builder(
        itemCount: projectList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.6,
            crossAxisCount: Dimen.getProjectItemInARow(context)),
        itemBuilder: (context, index) => DesktopProjectWidget(
          onTap: () {},
          imageUrl: projectList[index].image!,
          title: projectList[index].name!,
          description: projectList[index].description!,
          githubUrl: projectList[index].github!,
        ),
      ),
      selector: (p0, p1) => p1.myProjects,
    );
  }

  Container _buildTopRow(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: NameInfoContainer(),
          ),
          Expanded(
            flex: 1,
            child: ProfilePicture(),
          )
        ],
      ),
    );
  }
}
