import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/consts.dart';

Widget featuredBtn(icons,title){
  return Container(
    width:170,
    margin: const EdgeInsets.symmetric(horizontal:5),
    padding: const EdgeInsets.symmetric(horizontal:4,vertical: 2),
    decoration: BoxDecoration(
      color: AppColors.lightGrey,
      border: Border.all(
        color: AppColors.redColor,
      ),
      borderRadius: BorderRadius.circular(8)
    ),
    child: Row(
      children: [
        Image.asset(icons,height:50,fit: BoxFit.fill,),
        const SizedBox(width: 5,),
        Text(title)
      ],
    ),
  );
}