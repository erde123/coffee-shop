import 'package:flutter/material.dart';
import 'package:flutter_coffee_application/style/color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? error;
  final String hint;
  final FocusNode focus;
  final String? type;
  final VoidCallback? onNext; // New callback to handle "Next" button

  const LoginTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.error,
    required this.hint,
    required this.focus,
    required this.type,
    this.onNext, // Initialize the new callback
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  bool obscureText = true; // Variable to control password visibility

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focus,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: widget.onNext != null
          ? TextInputAction.next
          : null, // Set TextInputAction based on onNext callback
      onSubmitted: (_) {
        if (widget.onNext != null) {
          widget.onNext!(); // Call onNext callback
        }
      },
      obscureText: widget.type == "pass" ? obscureText : false, // Show/hide password text
      maxLines: 1,
      decoration: InputDecoration(
        errorText: widget.error,
        hintText: widget.hint,
        suffixIcon: widget.focus.hasFocus
            ? widget.type == "email"
                ? IconButton(
                    onPressed: () => widget.controller.clear(),
                    icon: Icon(
                      Icons.close,
                      color: primary,
                    ),
                  )
                : IconButton(
                    onPressed: togglePasswordVisibility, // Toggle password visibility
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility, // Change icon based on visibility state
                      color: primary,
                    ),
                  )
            : null,
      ),
    );
  }
}
