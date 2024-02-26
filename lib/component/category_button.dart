import 'package:flutter/material.dart';

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
            color: tap ? Colors.green : Colors.white,
            border: Border.all(
                width: 1, color: tap ? Colors.green : Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              title,
              style: TextStyle(
                color: tap
                    ? Colors.white
                    : Colors.grey.shade600,
                    fontSize: 15
              ),
            ),
          ),
        ),
      ),
    );
  }
}
