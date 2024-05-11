// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/style.dart';

class QTextFieldAuth extends StatefulWidget {
  final String? id;
  final TextEditingController? textC;
  final String? label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final bool isCorrect;
  final int? maxLength;
  final Padding? prefixIcon;
  final IconData? icon;
  final GestureDetector? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  const QTextFieldAuth({
    Key? key,
    this.id,
    this.label,
    this.isCorrect = false,
    required this.textC,
    this.icon,
    this.value,
    required this.hint,
    this.helper,
    this.validator,
    this.obscure = false,
    this.enabled = true,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<QTextFieldAuth> createState() => _QTextFieldAuthState();
}

class _QTextFieldAuthState extends State<QTextFieldAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      // textCapitalization: TextCapitalization.characters,
      controller: widget.textC,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hint,
        suffixIcon: widget.suffixIcon,
        prefixIconConstraints:
            const BoxConstraints(minWidth: 23, maxHeight: 20),
        suffixIconConstraints:
            const BoxConstraints(minWidth: 23, maxHeight: 20),
        hintStyle:
            const TextStyle(fontFamily: "gilroySemi", color: Colors.black26),
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.transparent,
        )),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      onChanged: (value) {},
      validator: widget.validator,
    ));
  }
}

class QtTextField extends StatefulWidget {
  final TextEditingController textC;
  final TextInputType? type;
  final int? maxLine;
  final String hint;
  final Function? onTap;

  const QtTextField({
    Key? key,
    required this.textC,
    this.type,
    this.maxLine,
    required this.hint,
    this.onTap,
  }) : super(key: key);

  @override
  State<QtTextField> createState() => _QtTextFieldState();
}

class _QtTextFieldState extends State<QtTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.greyColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: TextFormField(
        controller: widget.textC,
        maxLines: widget.maxLine,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          filled: true,
          fillColor: Colors.blue.withOpacity(0.08),
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: AppColor.greyColor.withOpacity(0.9),
            fontSize: 16.0,
          ),
          border: InputBorder.none,
        ),
        onTap: () => widget.onTap!(),
      ),
    );
  }
}

class TextFieldEditProfil extends StatelessWidget {
  final String label;
  final String? text;
  final bool isTextField;
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType? type;
  const TextFieldEditProfil({
    Key? key,
    required this.label,
    this.text,
    required this.isTextField,
    required this.readOnly,
    this.controller,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 80,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.greyColor.withOpacity(0.4),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Style.Subtitle1.copyWith(
              fontFamily: 'Signika',
            ),
          ),
          isTextField == true
              ? Container(
                  margin: const EdgeInsets.only(top: 19),
                  height: 10,
                  width: Get.width,
                  child: TextFormField(
                    readOnly: readOnly,
                    keyboardType: type,
                    controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("object");
                      }
                      return null;
                    },
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: const TextStyle(
                      fontFamily: 'SignikaSemi',
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    text!,
                    style: const TextStyle(
                      fontFamily: 'SignikaSemi',
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

Widget textFieldNormal(
    {required label,
    required TextEditingController textCtrl,
    required bool readOnly,
    required Function ontap,
    required Function onChanged,
    required Function validator,
    required TextInputType textInputType,
    required int maxLines,
    final GestureDetector? suffixIcon,
    final bool? obscureText,
    required Icon icon}) {
  return TextFormField(
    keyboardType: textInputType,
    controller: textCtrl,
    readOnly: readOnly,
    onTap: () => ontap(),
    onChanged: (value) => onChanged(value),
    validator: (value) => validator(value),
    maxLines: maxLines,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
        hintText: label,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        isDense: true,
        contentPadding: const EdgeInsets.all(20),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey.withOpacity(0.7),
        ),
        fillColor: AppColor.bluePrimary.withOpacity(0.1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.greyColor.withOpacity(0.4),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.greyColor.withOpacity(0.4),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        )),
  );
}
