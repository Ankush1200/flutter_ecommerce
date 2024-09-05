import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/common/widgets/custom_btn.dart';
import 'package:flutter_ecommerce/constants/consts.dart';
import 'package:readmore/readmore.dart';

class ItemDetailsScreen extends StatefulWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  const ItemDetailsScreen({super.key, required this.itemImage, required this.itemName, required this.itemPrice});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  int count=1;
  late int totalPrice=int.parse(widget.itemPrice);
  
  int sum=0;
  
  @override
  void initState(){
    super.initState();
    // assert(totalPrice);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(5,(index)=>Center(child: Image.asset(widget.itemImage,height:250,)),),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Text(widget.itemName,style:const TextStyle(fontWeight: FontWeight.bold)),
                    Row(children:List.generate(3,(index)=>const Text("⭐")),),
                    Text(widget.itemPrice,style:const TextStyle(color: AppColors.redColor,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,width: double.infinity,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(8)),
                      child:const Row(children: [
                        Expanded(flex: 1, child: Icon(Icons.sell_outlined)),
                        Expanded(flex: 5, child: Text("In House Seller"),),
                        Expanded(flex: 2, child: CircleAvatar(child: Icon(Icons.message),)),
                      ],),
                    ),
                    const SizedBox(height: 10,width: double.infinity,),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(8)),
                      child:  Column(
                        children: [
                          const Row(
                            children: [
                              Text("Color"),
                              SizedBox(width: 50,),
                              CircleAvatar(backgroundColor: Color.fromARGB(255, 255, 0, 0),radius: 15,),
                              SizedBox(width: 10,),
                              CircleAvatar(backgroundColor: Colors.black,radius: 15,),
                              SizedBox(width: 10,),
                              CircleAvatar(backgroundColor: Colors.green,radius: 15,),
                            ],
                          ),
                          const SizedBox(height: 10,width: double.infinity,),
                          Row(
                            children: [
                              const Text("Quantity:"),
                              const SizedBox(width: 20,),
                              count<=1? IconButton(onPressed:() {},icon:const Icon(Icons.remove))
                              :IconButton(icon: const Icon(Icons.remove),onPressed: (){
                                setState(() {
                                    count--;
                                  });
                              },),
                              const SizedBox(width: 10,),
                              CircleAvatar(backgroundColor:AppColors.darkFontGrey,radius:15,child:Text("$count",style: const TextStyle(color: AppColors.whiteColor),)),
                              const SizedBox(width: 10,),
                              IconButton(onPressed:() {
                                  setState(() {
                                    count++;
                                  });
                                },icon:const Icon(Icons.add)),
                            ],
                          ),
                          const SizedBox(height: 10,width: double.infinity,),
                          Row(
                            children: [
                              const Text("Total Price"),
                              const SizedBox(width: 10,),
                              Text("₹${totalPrice.toString()}")
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(8)),
                      child:const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description:",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.redColor),),
                          ReadMoreText(
                              "Suit Style: Straight, Salwar Type: Churidar, Pattern: Straight, Dupatta: Cotton, Brand: Radha, Stitch Type: Unstitched Suit, Sleeve Type: Half Sleeve, Neck Type",
                              trimMode: TrimMode.Line,
                              trimLines: 2,
                              colorClickableText: AppColors.redColor,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(fontSize: 14,color: AppColors.golden),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,width: double.infinity,),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children:List.generate(listNames.length,(index)=>Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(8)),
                        child:  ListTile(
                          title:Text(listNames[index]),
                          trailing:const Icon(Icons.arrow_forward_ios),
                        ),
                      )),
                    )
                  ],),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: customElevatedBtn("Add To Cart", (){}, AppColors.redColor,AppColors.whiteColor)),
                const SizedBox(width: 10,),
                Expanded(child: customElevatedBtn("Buy Now", (){}, Colors.amber,AppColors.whiteColor))
              ],
            ),
            const SizedBox(height: 10,width: double.infinity,)
          ],
        ),
      ),
    );
  }
}