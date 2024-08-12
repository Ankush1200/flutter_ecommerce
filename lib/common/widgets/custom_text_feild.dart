import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/consts.dart';

Widget customTextFeild(TextEditingController?controller,String hintname){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      isDense: true,
      labelText:hintname,
      filled: true,
      fillColor: AppColors.lightGrey,
      border:InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide:const BorderSide(
          color: AppColors.redColor,
        ),
        borderRadius: BorderRadius.circular(5)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:const BorderSide(
          color: AppColors.redColor,
        ),
        borderRadius: BorderRadius.circular(5)
      ),

    ),
  );
}