import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/logo_container.dart';
import 'package:flutter_ecommerce/constants/colors.dart';
import 'package:flutter_ecommerce/constants/strings.dart';
import 'package:flutter_ecommerce/features/auth/login.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(()=>const LoginScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            logoContainerWidget(),
            const SizedBox(height: 20,),
            const Text(appversion,style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.whiteColor
            ),),
            const Spacer(),
            const Text(credits,style: TextStyle(
              color: AppColors.whiteColor
            ),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}