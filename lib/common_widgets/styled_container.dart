import 'package:flutter/material.dart';
import 'package:flutter_folio/constants/app_color.dart';
import 'package:flutter_folio/constants/dimen.dart';
import 'package:flutter_folio/utils/utils.dart';

class ShadowedContainer extends StatefulWidget {
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
  State<ShadowedContainer> createState() => _ShadowedContainerState();
}

class _ShadowedContainerState extends State<ShadowedContainer> {
  Color _shadowColor = AppColor.primary;
  @override
  Widget build(BuildContext context) {
    double deviceWidth = Dimen.getCurrentWidth(context);
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _shadowColor = AppColor.onPrimary;
        });
      },
      onExit: (event) {
        setState(() {
          _shadowColor = AppColor.primary;
        });
      },

      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          padding: widget.padding ?? EdgeInsets.all(deviceWidth * 0.004),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: _shadowColor,
                  offset: const Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 1)
            ],
          ),
          duration: const Duration(microseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }
}

class BorderedContainer extends StatefulWidget {
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
  State<BorderedContainer> createState() => _BorderedContainerState();
}

class _BorderedContainerState extends State<BorderedContainer> {

  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        setState(() {
          borderColor = null;
        });

      },
      onEnter: (event) {
        setState(() {
          borderColor = AppColor.primary;
        });

      },
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          margin: widget.margin,
          width: widget.width,
          height: widget.height,
          clipBehavior: Clip.hardEdge,
          padding: widget.padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: widget.color??Colors.white10,
              border: borderColor!=null? Border.all(color: borderColor!, width: 1): Border.all(),
              borderRadius: widget.roundCorner? BorderRadius.circular(5):null,
              ),
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }
}
