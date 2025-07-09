import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomForm extends StatefulWidget {
  final TextEditingController controller;
  final Function(String input)? onChanged;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool hasError;
  final FocusNode focus;
  final bool readOnly;
  final double height;
  final double width;
  final double radius;
  final double leftPadding;
  final String? hintText;
  final Color? color;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  const CustomForm({
    super.key,
    required this.controller,
    this.readOnly = false,
    this.validator,
    this.prefix,
    this.suffix,
    this.inputFormatters,
    required this.focus,
    this.onChanged,
    this.leftPadding = 16,
    this.radius = 10,
    this.height = 58,
    this.width = 350,
    required this.color,
    this.prefixIcon,
    this.hasError = false,
    required this.keyboardType,
    required this.borderColor,
    required this.autofillHints,
    this.hintText,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height.h,
      padding: EdgeInsets.only(
        left: widget.leftPadding.w,
        right: 16.w,
        top: widget.controller.text.isNotEmpty ? 2.h : 0,
      ),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(width: 1, color: widget.borderColor!),
      ),
      child: TextFormField(
        onTapOutside: (event) {
          widget.focus.unfocus();
        },
        readOnly: widget.readOnly,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        autofillHints: widget.autofillHints,
        controller: widget.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.width >= 600 ? 14.sp : 10.sp,
          fontFamily: 'manrope-light',
          fontWeight: FontWeight.w300,
        ),
        keyboardType: widget.keyboardType,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.sentences,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefix: widget.prefix,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffix,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xFF898D8F),
            fontSize: MediaQuery.of(context).size.width >= 600 ? 16.sp : 10.sp,
            fontFamily: 'manrope-light',
            fontWeight: FontWeight.w300,
          ),
        ),
        focusNode: widget.focus,
      ),
    );
  }
}
