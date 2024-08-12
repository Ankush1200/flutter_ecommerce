import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/images.dart';

Widget backgroundContainer(Widget?child){
  return Container(
    decoration:const BoxDecoration(
      image: DecorationImage(
        image:AssetImage(imgBackground),fit: BoxFit.cover),
    ),
    child:child,
  );
}