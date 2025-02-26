import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/screens/bottomNavBar/bottomNavBar.dart';
import 'package:whatsapp_clone/util/constants.dart';
import 'package:whatsapp_clone/util/helper.dart';

class orderSummary extends StatefulWidget {
  orderSummary({super.key,required this.price});
  int price;
  @override
  State<orderSummary> createState() => _orderSummaryState();
}

class _orderSummaryState extends State<orderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.home)),
          )
        ],
      ),
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0,top: 10,bottom: 20),
                    child: Text("Order Summary",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Order"),
                        Text('${widget.price.toString()}\$')
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Taxes"),
                        Text("5\$")
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery fees"),
                        Text("12\$")
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('${widget.price+12+5}\$',style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Estimated delivery time:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text("15 - 30 mins",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Payment methods",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: constants.brown
                      ),
                      child: ListTile(
                        title: const Text("Credit card",style: TextStyle(color: Colors.white),),
                        subtitle: const Text("5105 **** **** 0505",style: TextStyle(color: Colors.white),),
                        leading: Image.asset("assets/images/orderSummary/master_card.png"),
                        trailing: const Icon(Icons.circle_outlined,color: Colors.white,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Checkbox(value: true, onChanged: (bool){},activeColor: constants.bg2,),
                        const Text("Save card details for future payments",),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                width: helper.deviceWidth(context),
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text("Total price"),
                              Text('${widget.price+12+5}\$',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return Dialog(
                            child: Container(
                              height: helper.deviceHeight(context)*0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    child: Icon(Iconsax.tick_circle,size: 52,color: Colors.white,),
                                    radius: 52,
                                    backgroundColor: constants.bg2,
                                  ),
                                  Column(
                                    children: [
                                      Text("Success !",style: TextStyle(fontSize: 35,color: constants.bg2),),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 40.0,left: 40,top: 10),
                                        child: Text("Your payment was successful. A receipt for this purchase has been sent to your email.",style: TextStyle(fontSize: 16),),
                                      ),
                                    ],
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                        return const bottomNavBar();
                                      }));
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: constants.bg2,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: const Center(
                                        child: Text("Go Home",style: TextStyle(color: Colors.white,fontSize: 16),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            color: constants.bg2,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Center(
                          child: Text("Pay Now",style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
