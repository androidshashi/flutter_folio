import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_image.dart';
import 'package:flutter_folio/constants/dimen.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColor.onPrimary,
      radius: Dimen.getProfilePicRadius(context),
      child: CircleAvatar(
        backgroundColor: AppColor.onPrimary,
        radius: Dimen.getProfilePicRadius(context) - 2,
        backgroundImage: const AssetImage(AppImage.profile),
      ),
    );
  }
}
