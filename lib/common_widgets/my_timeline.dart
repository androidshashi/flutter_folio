import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/model/experience_model.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:timeline_list/timeline_list.dart';

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<ExperienceModel>>(
      selector: (p0, vm) => vm.myExperience,
      builder: (context, myExperienceList, child) => Timeline.builder(
        context: context,
        markerCount: myExperienceList.length,
        properties: TimelineProperties(
            iconAlignment: MarkerIconAlignment.center,
            iconSize: Dimen.getProfilePicRadius(context) *
                (Dimen.isDesktop(context) ? 0.20 : 0.22),
            timelinePosition: Dimen.isMobile(context)
                ? TimelinePosition.start
                : TimelinePosition.center),
        markerBuilder: (context, index) => Marker(
          child: FittedBox(
            child: Text(
              "${myExperienceList[index].year}, ${myExperienceList[index].location},\n${myExperienceList[index].title}\n(${myExperienceList[index].company})",
              style: titleTextStyle.copyWith(
                  color: AppColor.primary,
                  fontSize: Dimen.getProfilePicRadius(context) *
                      (Dimen.isDesktop(context) ? 0.20 : 0.30)),
            ),
          ),
          position: Dimen.isMobile(context)
              ? MarkerPosition.left
              : index % 2 == 0
                  ? MarkerPosition.right
                  : MarkerPosition.left,
        ),
      ),
    );
  }
}
