import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/home_btn.dart'; 
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/constants/images_list.dart';
import 'package:flutter_ecommerce/features/home_screen/conponents/features_btn.dart';
import 'package:velocity_x/velocity_x.dart';

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
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:8),
                filled: true,
                isDense: true,
                suffixIcon: Icon(Icons.search,color: AppColors.redColor,size:30,),
                fillColor: AppColors.lightGrey,
                hintText: 'Search items',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: 0.5
                  ) 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: AppColors.redColor,
                    width: .5
                  ) 
                ), 
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
              // This swiper comes from velocity X package not inbuild in flutter........
              VxSwiper.builder(
                autoPlay: true,
                aspectRatio: 16/9,
                height: 120,
                enlargeCenterPage: true,
                itemCount: sliders1.length, itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(sliders1[index],fit: BoxFit.fill,),
                );
              }),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeBotton(80,100,icTodaysDeal,'Todays Deal',(){}),
                  homeBotton(80,100,icFlashDeal,'Flash Deal',(){}),
                ],
              ),
              const SizedBox(height: 10,),
              // This swiper comes from velocity X package not inbuild in flutter........
              // Second slider
              VxSwiper.builder(
                autoPlay: true,
                aspectRatio: 16/9,
                height: 120,
                enlargeCenterPage: true,
                itemCount: sliders2.length, itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(sliders2[index],fit: BoxFit.fill,),
                );
              }),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homeBotton(80,110,icCategories,'Top Categories',(){}),
                  homeBotton(80,100,icBrands,'Brands',(){}),
                  homeBotton(80,100,icTopSeller,'Top Seller',(){}),
                ],
              ),
              const SizedBox(height: 10,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Featured categries",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
              const SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(3,(index)=>Column(
                    children: [
                      featuredBtn(featuredImages1[index],featuredTitle1[index]),
                      const SizedBox(height: 5,),
                      featuredBtn(featuredImages2[index],featuredTitle2[index])
                    ],
                  ))
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 220,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                color: AppColors.redColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(featuredProducts,style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.whiteColor),),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics:const BouncingScrollPhysics(),
                      child: Row(
                        children:List.generate(featuredProductsImages.length,(index)=>Container(
                          margin:const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          color: AppColors.whiteColor,
                          child: Column(
                            children: [
                              Image.asset(featuredProductsImages[index],height: 110,),
                              Text(featuredProductsNames[index]),
                              const SizedBox(height:2,),
                              Text(featuredProductsPrice[index],style:const TextStyle(
                                fontSize: 15,
                                color: AppColors.redColor
                              ),)
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              VxSwiper.builder(
                autoPlay: true,
                // aspectRatio: 16/9,
                height: 100,
                enlargeCenterPage: true,
                itemCount: sliders3.length, itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(sliders3[index],fit: BoxFit.fill,),
                );
              }),
              const SizedBox(height: 10,),
              GridView.builder(
                itemCount:6,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,mainAxisSpacing: 5,crossAxisSpacing: 5,mainAxisExtent:260
                ),
                itemBuilder: (context,index){
                return Container(
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
                );
              })
              ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}