import 'package:flutter/material.dart';

import '../util/color_util.dart';

class TextInputFieldCommentEnabled extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int minLines;
  final int maxLines;
  final bool enabled;

  const TextInputFieldCommentEnabled(
      this.controller,
      this.hint,
      this.minLines,
      this.maxLines, {
        this.enabled = true,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      style: TextStyle(
        color: enabled ? Colors.black : Colors.grey.shade700,
      ),
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 2, color: ColorUtil.button),
        ),
      ),
    );
  }
}
