import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/colors.dart';

Widget homeBotton(double hight,double width,String icon,String label,VoidCallback onpressed) {
  return GestureDetector(
    onTap: onpressed,
    child: Container(
      height: hight,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.redColor, width: 0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon,height: 20,),
          const SizedBox(height: 10,),
          Text(label),
        ],
      ),
    ),
  );
}
