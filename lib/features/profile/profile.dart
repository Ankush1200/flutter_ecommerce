import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/container_bag.dart';
import 'package:flutter_ecommerce/common/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:flutter_ecommerce/constants/images_list.dart';
import 'package:flutter_ecommerce/features/profile/widgets/custom_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return backgroundContainer(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 80,width: double.infinity,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(radius: 30,backgroundColor: AppColors.golden,child: Icon(Icons.person,size:45,),),
                const Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                  Text("Ankush Prajapati",style: TextStyle(color: AppColors.whiteColor),),
                  Text('ankush49054@gmail.com',style: TextStyle(color: Color.fromARGB(255, 100, 85, 85)))
                ],),
                customElevatedBtn(
                'Edit', (){}, Colors.white, Colors.grey)
              ],
            ),
            const SizedBox(height:50,width: double.infinity,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customContainer(labelTitle: 'Placed Item',labelSubTitle: '10'),
                customContainer(labelTitle: 'WishLists',labelSubTitle: '15'),
                customContainer(labelTitle: 'Total Order',labelSubTitle: '20'),
              ],
            ),
            const SizedBox(height: 50,width: double.infinity,),
            Container(
              height:300,width:300,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    blurRadius:10,
                    color: AppColors.darkFontGrey,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer
                  )
                ]
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: profileTitle.length,
                separatorBuilder: (context,index){
                  return  const Divider(color: AppColors.darkFontGrey,);
                },
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(profileTitle[index],style: const TextStyle(fontSize: 15),),
                    leading: Image.asset(profileIcons[index],height:18,),
                  );
                }, )
            )
          ],
        ),
      )
    );
  }
}