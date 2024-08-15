import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/controllers/home_controller.dart';
import 'package:flutter_ecommerce/features/cart/cart.dart';
import 'package:flutter_ecommerce/features/categories/categories.dart';
import 'package:flutter_ecommerce/features/home_screen/home_screen.dart';
import 'package:flutter_ecommerce/features/profile/profile.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    var controller=Get.put(HomeController());
    var navBarItems=[
      BottomNavigationBarItem(icon:Image.asset(icHome,width: 20,),label: 'Home'),
      BottomNavigationBarItem(icon:Image.asset(icCategories,width: 20,),label: 'Categories'),
      BottomNavigationBarItem(icon:Image.asset(icCart,width: 20,),label: 'Cart'),
      BottomNavigationBarItem(icon:Image.asset(icProfile,width: 20,),label: 'Profile'),
    ];

    var navBarBody=[
       const HomeScreen(),
      //  const CategoriesScreen(),
       const CartScreen(),
       const ProfileScreen(),
    ];

    return Scaffold(
      body:Obx(()=> navBarBody[controller.currentNavIndex.value]),
      bottomNavigationBar:Obx(()=>
        BottomNavigationBar(items:navBarItems,
        currentIndex:controller.currentNavIndex.value,
        selectedItemColor:AppColors.redColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        onTap: (val){
          controller.currentNavIndex.value=val;
        },
        ),
      )
    );
  }
}