import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/dimen.dart';

class ResponsiveWidget extends StatefulWidget {
  const ResponsiveWidget(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  State<ResponsiveWidget> createState() => _ResponsiveWidgetState();
}

class _ResponsiveWidgetState extends State<ResponsiveWidget> {
  @override
  Widget build(BuildContext context) {
    if (Dimen.isMobile(context)) return widget.mobile ?? Container();
    if (Dimen.isTablet(context)) return widget.tablet ?? Container();
    if (Dimen.isDesktop(context)) return widget.desktop ?? Container();
    return Container();
  }
}
