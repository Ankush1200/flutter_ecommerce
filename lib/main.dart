import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/features/auth/login.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.transparent
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.redColor),
        fontFamily: "Mooli",
      ),
      home: const LoginScreen(),
    );
  }
}