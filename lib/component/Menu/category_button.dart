import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/style/color.dart';

class ButtonCategory extends StatelessWidget {
  final bool tap;
  final int index;
  final GestureTapCallback onPressed;
  final String title;
  const ButtonCategory({
    super.key,
    required this.tap,
    required this.index,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 32,
        decoration: BoxDecoration(
            color: tap ? primarySplash : Colors.white,
            border: Border.all(
                width: 1, color: tap ? primaryDark : grey1),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              title,
              style: TextStyle(
                color: tap
                    ? primaryDark
                    : grey1,
                    fontSize: 15
              ),
            ),
          ),
        ),
      ),
    );
  }
}
