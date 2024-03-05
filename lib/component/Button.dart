// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/style/color.dart';

class Button extends StatelessWidget {
  GestureTapCallback onPressed;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  Button({
    super.key,
    required this.onPressed,
    this.height,
    this.width,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RawMaterialButton(
        fillColor: primary,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: child,
      ),
    );
  }
}

class ButtonOutline extends StatelessWidget {
  GestureTapCallback onPressed;
  final Widget child;
  final double? height;
  final double? width;
  ButtonOutline({
    super.key,
    required this.onPressed,
    this.height,
    this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: primary,
            ),
            surfaceTintColor: primaryPastel,
            foregroundColor: primaryPastel),
        onPressed: () => onPressed(),
        child: child,
      ),
    );
  }
}

class ButtonSubmit extends StatelessWidget {
  GestureTapCallback onPressed;
  bool? enable;
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final double? elevate;

  ButtonSubmit({
    super.key,
    required this.onPressed,
    this.enable,
    this.height,
    this.width,
    this.color,
    this.elevate,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RawMaterialButton(
        elevation: elevate != null ? elevate! : 0,
        disabledElevation: elevate != null ? elevate! : 0,
        fillColor: enable != null
            ? enable!
                ? color ?? primary
                : Colors.grey[350]
            : color ?? primary,
        onPressed: enable != null
            ? enable!
                ? onPressed
                : null
            : onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}
