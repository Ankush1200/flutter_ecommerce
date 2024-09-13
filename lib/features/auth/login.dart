import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ecommerce/common/widgets/container_bag.dart';
import 'package:flutter_ecommerce/common/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/common/widgets/custom_text_feild.dart';
import 'package:flutter_ecommerce/common/widgets/logo_container.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/constants/images_list.dart';
import 'package:flutter_ecommerce/features/auth/forget_password.dart';
import 'package:flutter_ecommerce/features/auth/signup.dart';
import 'package:flutter_ecommerce/features/home/home.dart';
import 'package:flutter_ecommerce/services/authentication.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var controller = Get.put(Authentication());

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
                "Login to V-Mart",
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
                      customTextFeild(emailController, 'Email', false),
                      const SizedBox(height: 10),
                      customTextFeild(passwordController, 'Password', true),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Get.to(() => const ForgetPasswordScreen());
                            },
                            child: const Text(
                              "Forget Password?",
                              style: AppStyling.heading2,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: customElevatedBtn(
                              'Log In',
                              () async {
                                try {
                                  if (emailController.text.isEmpty &&passwordController.text.isEmpty) {
                                    VxToast.show(
                                      bgColor: AppColors.redColor,
                                      textColor: Colors.white,
                                      context,msg: 'Email-Password *required');
                                  } else {
                                    EasyLoading.show(status: 'Logging...');
                                    await controller.login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      context: context,
                                    ).then((value) {
                                      if (value != null) {
                                        EasyLoading.dismiss();
                                        VxToast.show(
                                          bgColor: AppColors.redColor,
                                          textColor: Colors.white,
                                          context,msg: 'Logged In Successfully');
                                        Get.offAll(() => const Home());
                                      } else {
                                        Get.offAll(() => const LoginScreen());
                                      }
                                    });
                                  }
                                } catch (e) {
                                  VxToast.show(bgColor: AppColors.redColor,
                                    textColor: Colors.white,
                                    context, msg: '$e');
                                }
                              },
                              AppColors.redColor,
                              AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Text('Create New Account',
                              style: TextStyle(color: Colors.indigo))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: customElevatedBtn('SignUp', () {
                              Get.to(() => const SignUpScreen());
                            }, AppColors.lightgolden, AppColors.redColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                          alignment: Alignment.center,
                          child: Text('Log In with',
                              style: TextStyle(color: Colors.indigo))),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.lightGrey,
                                      radius: 20,
                                      child: Image.asset(
                                        socialMediaIcons[index],
                                        height: 25,
                                        width: 25,
                                      ),
                                    ),
                                  )))
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
