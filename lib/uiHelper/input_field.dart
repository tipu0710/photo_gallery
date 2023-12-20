import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_gallery/utils/constant.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    this.labelText = "",
    this.validate = true,
    this.readOnly = false,
    this.maxWidth,
    this.maxHeight,
    this.borderRadius,
    this.contentPadding,
    this.textInputAction,
    this.keyboardType,
    this.focusNode,
    this.decoration,
    this.showShadow = false,
    this.maxLines,
    this.hints,
    this.onFieldSubmitted,
    this.suffixText,
    this.onDone,
    this.onChange,
    this.inputFormatters,
    this.suffixIcon,
    this.prefixIcon,
    this.enable = true,
    this.obscureText = false,
    this.maxLetter,
    this.fillColor,
    this.borderColor,
    this.cursorColor,
    this.inputColor,
    this.validator,
    this.maxErrorTextLine = 1,
    this.autofillHints,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.hintStyle,
    this.textStyle,
    this.labelTextColor,
    this.onTap,
  });

  final TextEditingController controller;

  /// Default [maxWidth = 300, maxHeight = 40]
  final double? maxWidth, maxHeight;
  final double? borderRadius;
  final String labelText;
  final String? hints;

  final BoxConstraints? prefixIconConstraints, suffixIconConstraints;

  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  /// Default
  /// ```dart
  /// const EdgeInsets.symmetric(horizontal: 15);
  /// ```
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool validate;
  final bool readOnly;
  final bool enable;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final bool showShadow;
  final int? maxLines;
  final String? suffixText;

  /// Default
  /// ```dart
  /// const TextStyle(color: Color.fromARGB(255, 190, 190, 190));
  /// ```
  final TextStyle? hintStyle, textStyle;

  final void Function(String?)? onDone;
  final void Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLetter;

  final Color? fillColor;
  final Color? borderColor;
  final Color? cursorColor;
  final Color? inputColor;
  final Color? labelTextColor;

  final bool obscureText;

  final int maxErrorTextLine;
  final Iterable<String>? autofillHints;

  final void Function()? onTap;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  double maxHeight = 45;

  @override
  void initState() {
    maxHeight = widget.maxHeight ?? maxHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      obscureText: widget.obscureText,
      controller: widget.controller,
      readOnly: widget.readOnly,
      enabled: widget.enable,
      focusNode: widget.focusNode,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: widget.inputFormatters,
      onSaved: widget.onDone,
      onChanged: widget.onChange,
      maxLength: widget.maxLetter,
      cursorColor: widget.cursorColor,
      autofillHints: widget.autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validate
          ? (s) {
              String? errorMessage;
              if (widget.validator != null) {
                errorMessage = widget.validator!(s);
              } else {
                var error = s == null || s.isEmpty;
                errorMessage = error ? "This field is required" : null;
              }
              return errorMessage;
            }
          : null,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      style: widget.textStyle ??
          TextStyle(
            fontSize: 12,
            color: widget.inputColor ??
                const Color.fromARGB(255, 18, 18, 18),
          ),
      decoration: widget.decoration ??
          InputDecoration(
            labelText: widget.labelText,
            isDense: false,
            hintText: widget.hints,
            alignLabelWithHint: true,
            suffixText: widget.suffixText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: const TextStyle(
              fontSize: 12,
              color: primaryColor,
            ),
            hintStyle: widget.hintStyle ??
                const TextStyle(
                  color: Color.fromARGB(255, 162, 162, 162),
                  fontSize: 12,
                ),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 15),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            suffixIconConstraints: widget.suffixIconConstraints,
            fillColor: widget.fillColor,
            disabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                color: widget.borderColor ??
                    const Color.fromARGB(255, 144, 144, 144),
                width: .8,
              ),
            ),
            errorStyle: TextStyle(
              fontSize: 12,
              color: widget.inputColor ??
                  const Color.fromARGB(255, 255, 0, 0),
            ),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                color: widget.borderColor ?? primaryColor,
                width: .8,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                color: widget.borderColor ?? primaryColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: BorderSide(
                color: widget.borderColor ?? primaryColor,
                width: .8,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? 8),
              borderSide: const BorderSide(
                color: Colors.red,
                width: .8,
              ),
            ),
          ),
    );
  }
}
