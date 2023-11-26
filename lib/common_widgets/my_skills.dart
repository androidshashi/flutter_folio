import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

class MySkills extends StatelessWidget {
  const MySkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<String>>(
      builder: (context, mySkills, child) => BorderedContainer(
          onTap: null,
          padding: EdgeInsets.symmetric(
              vertical: Dimen.getCurrentWidth(context) * 0.010),
          child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                  mySkills.length,
                  (index) => Chip(
                        labelStyle: subTitleStyle.copyWith(
                            color: AppColor.onPrimary,
                            fontSize: Dimen.getProfilePicRadius(context) * 0.2),
                        label: Text(mySkills[index]),
                        backgroundColor: AppColor.primary,
                      )))),
      selector: (p0, p1) => p1.mySkills,
    );
  }
}
