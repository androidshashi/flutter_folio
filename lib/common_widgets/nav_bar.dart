import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_image.dart';
import 'package:flutter_folio/constants/app_localization.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar? customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.transparent,
    centerTitle: Dimen.isMobile(context),
    title: Dimen.isMobile(context)
        ? Text(
            "<${AppLocalization.siteName}/>",
            style: titleStyle,
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: Dimen.getCurrentWidth(context) * 0.10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShadowedContainer(
                  onTap: () {},
                  child: Text(
                    AppLocalization.siteName,
                    style: titleStyle,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse(context
                        .read<HomeViewModel>()
                        .aboutMeModel!
                        .resumeLink!));
                  },
                  child: Text(
                    AppLocalization.downloadResume,
                  ),
                ),
              ],
            ),
          ),
  );
}

Widget? customDrawer(BuildContext context) {
  if (Dimen.isMobile(context)) {
    return Drawer(
      backgroundColor: AppColor.primaryDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          CircleAvatar(
            backgroundColor: AppColor.onPrimary,
            radius: Dimen.getProfilePicRadius(context),
            child: CircleAvatar(
              backgroundColor: AppColor.onPrimary,
              radius: Dimen.getProfilePicRadius(context) - 5,
              backgroundImage: const AssetImage(AppImage.profile),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Email: ${context.watch<HomeViewModel>().aboutMeModel?.email}",
            style: headingTxtStyle.copyWith(
              fontSize: Dimen.getCurrentWidth(context) * 0.03,
            ),
          ),
          Text(
            "Phone: ${context.watch<HomeViewModel>().aboutMeModel?.contactNo}",
            style: headingTxtStyle.copyWith(
              fontSize: Dimen.getCurrentWidth(context) * 0.03,
            ),
          ),
          TextButton(
            onPressed: () {
              //only for flutter web mobile
              html.AnchorElement anchorElement = html.AnchorElement(
                  href:
                      context.read<HomeViewModel>().aboutMeModel!.resumeLink!);
              anchorElement.download =
                  context.read<HomeViewModel>().aboutMeModel!.resumeLink!;
              anchorElement.click();
              // launchUrl(Uri.parse(
              //     context.read<HomeViewModel>().aboutMeModel!.resumeLink!));
            },
            child: Text(
              AppLocalization.downloadResume,
            ),
          ),
        ],
      ),
    );
  }
  return null;
}
