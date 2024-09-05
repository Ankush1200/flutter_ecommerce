import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/container_bag.dart';
import 'package:flutter_ecommerce/constants/colors.dart';
import 'package:flutter_ecommerce/constants/images.dart';
import 'package:flutter_ecommerce/features/categories/item_details.dart';
import 'package:get/get.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  final String titleName;
  const CategoriesDetailsScreen({super.key,required this.titleName});

  @override
  Widget build(BuildContext context) {
    return backgroundContainer(
      Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.whiteColor,
          titleSpacing: 0,
          title: Text(titleName,style: const TextStyle(color: AppColors.whiteColor,fontSize: 16,fontWeight: FontWeight.bold),),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:List.generate(6,(index) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    margin:const EdgeInsets.symmetric(horizontal: 3,) ,
                    padding: const EdgeInsets.all(8),
                    child: const Center(child: Text("Click Me"),),),),
                ),
              ),
              const SizedBox(height: 10,width: double.infinity,),
              Expanded(child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 250,mainAxisSpacing:5,crossAxisSpacing: 5),itemCount: 9, itemBuilder: (context,index)=>
                GestureDetector(
                  onTap:()=>Get.to(()=>const ItemDetailsScreen(itemImage:imgFc11, itemName:"Ladies Suit", itemPrice: "2586"),),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(imgFc11,height: 170,fit: BoxFit.fill,),
                        const Text("Ladies Suit"),
                        const SizedBox(height: 2),
                        const Text("₹2586")
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      )
    );
  }
}