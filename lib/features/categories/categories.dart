import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/container_bag.dart';
import 'package:flutter_ecommerce/constants/colors.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/constants/images_list.dart';
import 'package:flutter_ecommerce/features/categories/categories_details.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundContainer(
      Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.whiteColor,
          titleSpacing: 0,
          title: const Text("Categories",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColors.whiteColor),),
        ),
        body: SingleChildScrollView(
          padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoriesImages.length,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 4,crossAxisSpacing: 4,mainAxisExtent:250), itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=>CategoriesDetailsScreen(titleName: categoriesName[index]));
                    },
                    child: Container(
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(categoriesImages[index],height:180,fit: BoxFit.cover,),
                          Text(categoriesName[index]),
                          const SizedBox(height: 5),
                          Text(categoriesPrice[index]),
                        ],
                      ),
                    ),
                  );
              }),
            ],
          ),
        ),
      )
    );
  }
}