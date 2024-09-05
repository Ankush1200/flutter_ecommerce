import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/colors.dart';

Widget customContainer({String? labelTitle, String?labelSubTitle}) {
  return Container(
    padding:const EdgeInsets.symmetric(horizontal: 12,vertical:5),
    decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadiusDirectional.circular(5)),
    child:Column(
      children: [
        Text('$labelTitle',style:const TextStyle(fontSize: 15,),),
        const SizedBox(height:5),
        Text('$labelSubTitle',style:const TextStyle(fontSize: 15,),),
      ],
    ),
  );
}
