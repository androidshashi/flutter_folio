import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_image.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';

class MobileProjectWidget extends StatelessWidget {
  const MobileProjectWidget(
      {Key? key,
      required this.onTap,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.githubUrl})
      : super(key: key);
  final VoidCallback onTap;
  final String imageUrl;
  final String title;
  final String description;
  final String githubUrl;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
        onTap: onTap,
        width: double.infinity,
        height: Dimen.getCurrentWidth(context) * 0.7,
        padding: EdgeInsets.zero,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(alignment: Alignment.center, children: [
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
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
                child: Text(
                  title,
                  style: titleStyle.copyWith(color: AppColor.primary),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    description,
                    style: subTitleStyle,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ]));
  }
}
