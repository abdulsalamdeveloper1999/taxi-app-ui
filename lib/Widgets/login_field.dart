// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/weight.dart';
import 'mediaquery.dart';

class LoginFields extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  var hintText, suffixicon, prefixicon;
  bool? obSecure;
  TextEditingController? formcontroller = TextEditingController();
  ValueChanged<String>? onChanged;
  var fieldValidator;
  var onSavedState;
  var fillColor;
  var style;
  var hintStyle;
  var contentPadding;
  var enableBorder;
  var focusBorder;
  var border;
  var errorBorder;

  LoginFields(
      {Key? key,
      this.border,
      this.errorBorder,
      this.focusBorder,
      this.enableBorder,
      this.contentPadding,
      this.style,
      this.hintStyle,
      this.fillColor = kwhite,
      this.hintText,
      this.onChanged,
      this.formcontroller,
      this.obSecure = false,
      this.suffixicon,
      this.prefixicon,
      this.fieldValidator,
      this.onSavedState})
      : super(key: key);

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return Container(
      child: TextFormField(
        textInputAction: TextInputAction.next,
        style: widget.style,
        obscureText: widget.obSecure!,
        controller: widget.formcontroller,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          hintText: '${widget.hintText}',
          prefixIcon: widget.prefixicon,
          suffixIcon: widget.suffixicon,
          // labelText: '${widget.hintText}',
          // labelStyle: khintStyle(),
          hintStyle: TextStyle(
            fontSize: 14 * sp,
            fontWeight: kfour,
            color: Color(0xffA5A5A5),
            fontFamily: 'Poppins',
          ),
          contentPadding: widget.contentPadding,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          fillColor: widget.fillColor,
          filled: true,
        ),
        validator: widget.fieldValidator,
      ),
    );
  }
}
