import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/model/experience_model.dart';
import 'package:flutter_folio/utils/utils.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';

class MyTimeLine extends StatelessWidget {
  const MyTimeLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<ExperienceModel>>(
        selector: (p0, vm) => vm.myExperience,
        builder: (context, myExperienceList, child) =>
            FixedTimeline.tileBuilder(
              theme: timelineThemeData,
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
            ));
  }
}
