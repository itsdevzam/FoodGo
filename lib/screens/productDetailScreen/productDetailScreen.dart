import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/screens/orderSummary/orderSummary.dart';
import 'package:whatsapp_clone/util/constants.dart';
import 'package:whatsapp_clone/util/helper.dart';

class productDetailScreen extends StatefulWidget {
  String name, type, imgPath, rating, time, description;
  int price,itemIndex;

  productDetailScreen(
      {super.key,
      required this.name,
      required this.type,
      required this.imgPath,
      required this.rating,
      required this.time,
      required this.description,
      required this.itemIndex,
      required this.price});

  @override
  State<productDetailScreen> createState() => _productDetailScreenState();
}

class _productDetailScreenState extends State<productDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          )
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        "${widget.imgPath}hd.png",
                        width: helper.deviceWidth(context),
                        height: helper.deviceHeight(context) / 2.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "${widget.name} ${widget.type}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.rating} - ${widget.time}',
                            style: TextStyle(color: constants.grey,fontSize: 15),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        width: helper.deviceWidth(context)*0.9,
                          child: Text(
                        widget.description,
                        style: TextStyle(color: constants.grey,fontSize: 16),
                            textAlign: TextAlign.left,
                      )),
                    )
                  ],
                )),
            Positioned(
                bottom: 0,
                width: helper.deviceWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            elevation:10,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: helper.deviceWidth(context)*0.2,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: constants.bg2,
                              ),
                              child: Center(child: Text('\$${widget.price.toString()}',style: const TextStyle(color: Colors.white,fontSize: 24),)),
                            ),
                          ),
                          Material(
                            elevation:10,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: helper.deviceWidth(context)*0.4,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: constants.brown,
                              ),
                              child: GestureDetector(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return orderSummary(price:widget.price);
                                }));
                              },child: const Center(child: Text('ORDER NOW',style: TextStyle(color: Colors.white,fontSize: 18),))),
                            ),
                          ),
                          Material(
                            elevation:10,
                            borderRadius: BorderRadius.circular(20),
                            child: GestureDetector(
                              onTap: (){
                                 setState(() {
                                   constants.listData[widget.itemIndex]['incart']?constants.listData[widget.itemIndex]['incart']=false:constants.listData[widget.itemIndex]['incart']=true;
                                   constants.listData[widget.itemIndex]['incart']?helper.showToast("Added to cart", ToastGravity.BOTTOM):helper.showToast("Removed from cart", ToastGravity.BOTTOM);

                                 });
                              },
                              child: Container(
                                width: helper.deviceWidth(context)*0.18,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: constants.bg2,
                                ),
                                child: Center(child: constants.listData[widget.itemIndex]['incart']?Icon(Iconsax.tick_circle,color: Colors.white,):Icon(Iconsax.shopping_cart,color: Colors.white,)),
                              ),
                            ),
                          ),
                        ],
                      ),
                )),
          ],
        ),
      ),
    );
  }
}
