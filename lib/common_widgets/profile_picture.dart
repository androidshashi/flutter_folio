import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_image.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: AppColor.onPrimary,
          radius: Dimen.getProfilePicRadius(context),
          child: CircleAvatar(
            backgroundColor: AppColor.onPrimary,
            radius: Dimen.getProfilePicRadius(context) - 2,
            backgroundImage: const AssetImage(AppImage.profile),
          ),
        ),
        SizedBox(
          height: Dimen.getCurrentWidth(context) * 0.02,
        ),
        if (!Dimen.isMobile(context))
          Text(
            "Email: ${context.watch<HomeViewModel>().aboutMeModel?.email}\nPhone: ${context.watch<HomeViewModel>().aboutMeModel?.contactNo}",
            style: headingTxtStyle.copyWith(
              fontSize: Dimen.getCurrentWidth(context) * 0.01,
            ),
          ),
      ],
    );
  }
}
