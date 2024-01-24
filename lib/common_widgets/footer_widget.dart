import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/styled_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
        width: double.infinity,
        height: 40,
        onTap: null,
        roundCorner: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () => launchUrl(Uri.parse(
                    context.read<HomeViewModel>().aboutMeModel!.linkedIn!)),
                child: Text(
                  "Designed & Developed by Shashi Kumar",
                  textAlign: TextAlign.center,
                  style: subTitleTextStyle.copyWith(color: AppColor.primary),
                ))
          ],
        ));
  }
}
