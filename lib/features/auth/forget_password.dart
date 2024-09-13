import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/container_bag.dart';
import 'package:flutter_ecommerce/common/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/common/widgets/custom_text_feild.dart';
import 'package:flutter_ecommerce/common/widgets/logo_container.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/features/auth/login.dart';
import 'package:get/get.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  bool value=false;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return backgroundContainer(
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child:Column(
            children: [
              const SizedBox(height:80,width: double.infinity,),
              logoContainerWidget(),
              const SizedBox(height:10,width: double.infinity,),
              const Text("Reset Password",style: AppStyling.heading1,),
              const SizedBox(height:20,width: double.infinity,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 2,vertical:15),
                width: MediaQuery.of(context).size.width-50,
                // height:MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                  color:AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow:const[
                 BoxShadow(
                    blurRadius:15,
                    spreadRadius:0,
                    color: AppColors.darkFontGrey,
                    blurStyle: BlurStyle.outer
                  )
                ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical:10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height:10),
                      customTextFeild(
                        passwordController,
                        'Email',
                        false
                      ),
                      const SizedBox(height:10),
                      customTextFeild(
                        passwordController,
                        'New Password',
                        true
                      ),
                      const SizedBox(height:10),
                      customTextFeild(
                        passwordController,
                        'Confirm Password',
                        true,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: customElevatedBtn('Reset',(){
                              
                            },AppColors.redColor,
                            AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an Account?",style: TextStyle(
                            fontSize: 15,
                            color: AppColors.darkFontGrey
                          ),),
                          TextButton(onPressed: (){
                            Get.to(()=>const LoginScreen());
                          }, child: const Text("login",style: TextStyle(
                            fontSize:15
                          ),))
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