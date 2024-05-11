// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:absensi_mahardika/app/data/mk_perizinan_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';

class TextFieldDropdown extends StatelessWidget {
  final List Items;
  final Color? colorFill;
  final Color? colorOutline;
  final TextStyle? textStyle;
  final RxString selectedValue;
  const TextFieldDropdown({
    Key? key,
    required this.Items,
    this.colorFill,
    this.colorOutline,
    this.textStyle,
    required this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        fillColor: colorFill ?? Colors.transparent,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: AppColor.bluePrimary.withOpacity(0.8),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: colorOutline ?? Colors.grey,
            width: 1,
          ),
        ),
        // Add more decoration..
      ),
      hint: const Text(
        'Pilih Pertemuan',
        style: TextStyle(fontSize: 14),
      ),
      items: Items.map((item) => DropdownMenuItem<String>(
            value: item.toString(),
            child: Text(
              item,
              style: textStyle ??
                  const TextStyle(
                    fontSize: 14,
                  ),
            ),
          )).toList(),
      validator: (value) {
        if (value == null) {
          return 'Silahkan pilih pertemuan.';
        }
        return null;
      },
      onChanged: (value) {
        selectedValue.value = value.toString();

        print(selectedValue.value);
      },
      onSaved: (value) {
        selectedValue.value = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
