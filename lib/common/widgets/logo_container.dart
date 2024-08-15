import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/colors.dart';
import 'package:flutter_ecommerce/constants/images.dart';

Widget logoContainerWidget(){
  return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
      ),
      child: Center(
          child: Image.asset(icAppLogo,height: 60,color:const Color.fromARGB(255, 161, 14, 63),
      )),
    );
}
