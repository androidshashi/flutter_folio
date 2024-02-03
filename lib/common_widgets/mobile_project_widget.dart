import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_image.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileProjectWidget extends StatelessWidget {
  const MobileProjectWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.githubUrl,
      required this.platform,
      required this.tools})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String description;
  final String githubUrl;
  final String platform;
  final String tools;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
        onTap: () => launchUrl(Uri.parse(githubUrl)),
        width: double.infinity,
        height: Dimen.getCurrentWidth(context) * 0.55,
        padding: EdgeInsets.zero,
        margin:  EdgeInsets.only(bottom: Dimen.getProfilePicRadius(context)*0.5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(alignment: Alignment.center, children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: ShadowedContainer(
                          onTap: () {},
                          child: const Image(
                            image: AssetImage(
                              AppImage.git,
                            ),
                            height: 20,
                            width: 20,
                          ))),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: titleStyle.copyWith(color: AppColor.primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "Tools: $tools",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:subTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  "Supports: $platform",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subTitleTextStyle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    description,
                    style: subTitleTextStyle,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ]));
  }
}
