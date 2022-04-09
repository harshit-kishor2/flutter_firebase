/* ************************************************************************
* Directory Name: custom                                                  *
* File Name: custom_input.dart                                            *
* Created At: Saturday, 9th April 2022 11:49:40 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */

import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization = TextCapitalization.none;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus = false;
  final bool readOnly = false;
  final bool obscureText = false;
  final int? maxLines = 1;
  final int? minLines;
  final bool expands = false;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool? enabled;
  const CustomInput({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textAlignVertical,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.inputDecorationTheme.hintStyle?.copyWith(
            color:
                theme.inputDecorationTheme.hintStyle?.color?.withOpacity(0.3)),
      ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      enabled: enabled,
    );
  }
}
