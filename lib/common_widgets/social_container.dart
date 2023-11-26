import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_image.dart';
import 'package:flutter_folio/constants/dimen.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconSize = Dimen.getCurrentWidth(context) * 0.04;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: Dimen.isMobile(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        ShadowedContainer(
          child: Image.asset(
            AppImage.flutter,
            height: iconSize,
            width: iconSize,
          ),
          onTap: () {},
        ),
        SizedBox(
          width: iconSize,
        ),
        ShadowedContainer(
          child: Image.asset(
            AppImage.linkedIn,
            height: iconSize,
            width: iconSize,
          ),
          onTap: () {},
        ),
        SizedBox(
          width: iconSize,
        ),
        ShadowedContainer(
          child: Image.asset(
            AppImage.git,
            height: iconSize,
            width: iconSize,
          ),
          onTap: () {},
        ),
        SizedBox(
          width: iconSize,
        ),
        ShadowedContainer(
          child: Image.asset(
            AppImage.fb,
            height: iconSize,
            width: iconSize,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
