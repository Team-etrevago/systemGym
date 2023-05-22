// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final String hintText;
  Color fillColor;
  Color textColor;
  Color focusedBorderColor;
  Color enabledBorderColor;
  TextEditingController? controller;
  bool obsecure;
  Widget? prefixIcon;
  bool multiLines;

  MyTextFormField({
    super.key,
    required this.validator,
    required this.hintText,
    this.prefixIcon,
    this.obsecure = false,
    this.multiLines = false,
    this.fillColor = white,
    this.textColor = white,
    this.focusedBorderColor = mainColor,
    this.enabledBorderColor = mainColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: multiLines ? 4 : 1,
      obscureText: obsecure,
      controller: controller,
      cursorColor: mainColor,
      style: TextStyle(color: textColor),
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          prefixIcon: multiLines
              ? Container(
                  height: 80,
                  width: 10,
                  alignment: Alignment.topCenter,
                  child: prefixIcon)
              : prefixIcon,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'),
          filled: true,
          border: UnderlineInputBorder(
              borderSide: const BorderSide(color: mainColor),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: enabledBorderColor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
