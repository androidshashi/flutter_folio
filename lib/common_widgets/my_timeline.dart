import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/model/experience_model.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<ExperienceModel>>(
        selector: (p0, vm) => vm.myExperience,
        builder: (context, myExperienceList, child) => SizedBox(
              height: myExperienceList.length *
                  (Dimen.isMobile(context) ? 110 : 120),
              child: Timeline.tileBuilder(
                physics: Dimen.isMobile(context)
                    ? const NeverScrollableScrollPhysics()
                    : null,
                theme: TimelineThemeData(
                  connectorTheme: ConnectorThemeData(
                    thickness: 3.0,
                    color: AppColor.primary,
                  ),
                  indicatorTheme: IndicatorThemeData(
                    size: 15.0,
                    color: AppColor.primary.shade400,
                  ),
                ),
                builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.alternating,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      "${myExperienceList[index].year}, ${myExperienceList[index].location},\n${myExperienceList[index].title}\n(${myExperienceList[index].company})",
                      style: titleTextStyle.copyWith(
                          color: AppColor.primary,
                          fontSize: Dimen.getProfilePicRadius(context) *
                              (Dimen.isDesktop(context) ? 0.15 : 0.20)),
                    ),
                  ),
                  itemCount: myExperienceList.length,
                ),
              ),
            ));
  }
}
