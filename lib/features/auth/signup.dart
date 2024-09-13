 import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/container_bag.dart';
import 'package:flutter_ecommerce/common/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/common/widgets/custom_text_feild.dart';
import 'package:flutter_ecommerce/common/widgets/logo_container.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/features/auth/login.dart';
import 'package:flutter_ecommerce/features/home/home.dart';
import 'package:flutter_ecommerce/features/home_screen/home_screen.dart';
import 'package:flutter_ecommerce/services/authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool value = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var controller=Get.put(Authentication());



  @override
  Widget build(BuildContext context) {
    return backgroundContainer(
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
                width: double.infinity,
              ),
              logoContainerWidget(),
              const SizedBox(
                height: 10,
                width: double.infinity,
              ),
              const Text(
                "SignUp to V-Mart",
                style: AppStyling.heading1,
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
                width: MediaQuery.of(context).size.width - 50,
                // height:MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 15,
                          spreadRadius: 0,
                          color: AppColors.darkFontGrey,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextFeild(
                        nameController,
                        'Name',
                        false
                      ),
                      const SizedBox(height: 10),
                      customTextFeild(
                        emailController,
                        'Email',
                        false
                      ),
                      const SizedBox(height: 10),
                      customTextFeild(
                        createPasswordController,
                        'Create Password',
                        true
                      ),
                      const SizedBox(height: 10),
                      customTextFeild(
                        confirmPasswordController,
                        'Confirm Password',
                        true
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value,
                              onChanged: (val) {
                                setState(() {
                                  value = val!;
                                });
                              }),
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'i agree the ',
                                    style: TextStyle(
                                        color: AppColors.darkFontGrey,
                                        fontSize: 12,
                                        fontFamily: 'Mooli'),
                                  ),
                                  TextSpan(
                                    text: 'Terms and Conditions ',
                                    style: TextStyle(
                                        color: AppColors.redColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Mooli'),
                                  ),
                                  TextSpan(
                                    text: '& ',
                                    style: TextStyle(
                                      color: AppColors.darkFontGrey,
                                      fontSize: 12,
                                      fontFamily: 'Mooli',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                        color: AppColors.darkFontGrey,
                                        fontSize: 12,
                                        fontFamily: 'Mooli'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: customElevatedBtn(
                              'SignUp',
                              () {
                                if (value == true){
                                  try{
                                    if(nameController.text.isEmpty&& emailController.text.isEmpty
                                      && createPasswordController.text.isEmpty&& confirmPasswordController.text.isEmpty ){
                                        VxToast.show(
                                          bgColor: AppColors.redColor,
                                          textColor: Colors.white,
                                          context,msg: 'All Fields is *required');
                                      }else{
                                        controller.signUp(
                                    email: emailController.text.trim(),
                                    password: createPasswordController.text.trim(),
                                    context: context,
                                  ).then((value){
                                    return controller.dataStorage(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: createPasswordController.text.trim(),
                                    );
                                  }).then((value){
                                    Get.offAll(()=>const Home());
                                    VxToast.show(bgColor: AppColors.redColor,textColor: Colors.white,
                                      context,msg: 'SignUp Successfully');
                                    });
                                    }
                                  }catch(e){
                                    VxToast.show(context, msg: '$e');
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Accept Terms & Conditions",
                                    fontSize: 14,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor:const Color.fromARGB(195, 86, 75, 74),
                                    textColor: Colors.white,
                                  );
                                }
                              },
                              value? AppColors.redColor: const Color.fromARGB(255, 220, 173, 175),
                              AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an Account?",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.darkFontGrey),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const LoginScreen());
                              },
                              child: const Text(
                                "login",
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
