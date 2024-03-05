import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? error;
  final String hint;
  final FocusNode focus;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.textInputType,
    required this.error,
    required this.hint,
    required this.focus,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focus,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      maxLines: 1,
      decoration: InputDecoration(
        errorText: widget.error,
        hintText: widget.hint,
        suffixIcon: widget.focus.hasFocus
            ? IconButton(
              onPressed: () => widget.controller.clear(),
              icon: Icon(
                  Icons.close,
                  color: primary,
                ),
            )
            : null,
      ),
    );
  }
}
