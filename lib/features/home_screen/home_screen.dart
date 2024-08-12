import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/colors.dart';
import 'package:flutter_ecommerce/constants/consts.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      color: AppColors.lightGrey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding:const EdgeInsets.all(10) ,
      child:SafeArea(child:Column(
        children: [
          Container(
            color:AppColors.lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding:const EdgeInsets.symmetric(horizontal: 20,vertical:8),
                filled: true,
                isDense: true,
                suffixIcon: Image.asset(icSearch,color: AppColors.redColor,height: 5,width: 5,),
                fillColor: AppColors.lightGrey,
                hintText: 'Search',
                border: InputBorder.none,
                enabledBorder:const OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: .5
                  ) 
                ),
                focusedBorder:const OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: .5
                  ) 
                ), 
              ),
            ),
          ),
        ],
      ) ,));
  }
}