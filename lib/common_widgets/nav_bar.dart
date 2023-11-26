import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_localization.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';

AppBar? customAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.transparent,
    centerTitle: Dimen.isMobile(context),
    title: Dimen.isMobile(context)
        ? Text(
            "<${AppLocalization.siteName}/>",
            style: titleStyle,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              ShadowedContainer(
                onTap: () {},
                child: Text(
                  AppLocalization.siteName,
                  style: titleStyle,
                ),
              ),
              const Spacer(),
              BorderedContainer(
                onTap: () {},
                child: Text(
                  "Projects",
                  style: titleStyle,
                ),
              ),
              const Spacer(),
              BorderedContainer(
                onTap: () {},
                child: Text(
                  "Contact me",
                  style: titleStyle,
                ),
              ),
              const Spacer(),
              BorderedContainer(
                onTap: () {},
                child: Text(
                  "About",
                  style: titleStyle,
                ),
              ),
              const Spacer(),
              BorderedContainer(
                onTap: () {},
                child: Text(
                  "Linked IN",
                  style: titleStyle,
                ),
              ),
              const Spacer(),
            ],
          ),
  );
}

Widget? customDrawer(BuildContext context) {
  if (Dimen.isMobile(context)) {
    return Drawer(
      backgroundColor: AppColor.black,
      child: Column(
        children: [
          ShadowedContainer(
            onTap: () {},
            child: Text(
              "Menu",
              style: titleStyle,
            ),
          ),
          Text(
            "Projects",
            style: titleStyle.copyWith(color: AppColor.primary),
          ),
          Text(
            "Contact me",
            style: titleStyle.copyWith(color: AppColor.primary),
          ),
          Text(
            "About",
            style: titleStyle.copyWith(color: AppColor.primary),
          ),
          Text(
            "Linked IN",
            style: titleStyle.copyWith(color: AppColor.primary),
          ),
        ],
      ),
    );
  }
  return null;
}
