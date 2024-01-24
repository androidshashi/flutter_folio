import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/dimen.dart';

class ShadowedContainer extends StatelessWidget {
  const ShadowedContainer(
      {Key? key,
      required this.child,
      required this.onTap,
      this.padding,
      this.onHover})
      : super(key: key);
  final Widget child;
  final VoidCallback onTap;
  final void Function(bool)? onHover;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = Dimen.getCurrentWidth(context);
    return InkWell(
      onTap: onTap,
      onHover: onHover,
      child: Container(
        padding: padding ?? EdgeInsets.all(deviceWidth * 0.004),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColor.primary,
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 1)
          ],
        ),
        child: child,
      ),
    );
  }
}

class BorderedContainer extends StatelessWidget {
  const BorderedContainer(
      {Key? key,
      required this.child,
      required this.onTap,
      this.padding,
      this.margin,
      this.width,
      this.height, this.color,  this.roundCorner=true})
      : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? color;
  final bool roundCorner;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = Dimen.getCurrentWidth(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        clipBehavior: Clip.hardEdge,
        padding: padding ?? EdgeInsets.all(deviceWidth * 0.004),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color??Colors.white10 ,
            borderRadius: roundCorner? BorderRadius.circular(5):null,
            ),
        child: child,
      ),
    );
  }
}
