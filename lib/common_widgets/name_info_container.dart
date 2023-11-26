import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folio/common_widgets/social_container.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/app_localization.dart';
import 'package:flutter_folio/constants/custom_styles.dart';
import 'package:flutter_folio/constants/dimen.dart';

class NameInfoContainer extends StatelessWidget {
  const NameInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = Dimen.getCurrentWidth(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: Dimen.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, There,",
          style: headingTxtStyle.copyWith(
            fontSize: deviceWidth * 0.05,
          ),
        ),
        RichText(
          text: TextSpan(
              text: "I'm ",
              children: [
                TextSpan(
                    text: AppLocalization.developerName,
                    style: subHeadingTxtStyle.copyWith(
                        fontSize: deviceWidth * 0.05,
                        fontWeight: FontWeight.w100))
              ],
              style: subHeadingTxtStyle.copyWith(
                  fontSize: deviceWidth * 0.04, fontWeight: FontWeight.w200)),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              AppLocalization.mobileAppDeveloper,
              textStyle: subHeadingTxtStyle.copyWith(
                  fontSize: deviceWidth * 0.03,
                  fontWeight: FontWeight.w200,
                  color: AppColor.primary),
              speed: const Duration(milliseconds: 200),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        SizedBox(
          height: deviceWidth * 0.03,
        ),
        const SocialContainer(),
      ],
    );
  }
}
