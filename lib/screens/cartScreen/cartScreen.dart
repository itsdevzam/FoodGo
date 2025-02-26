import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/screens/orderSummary/orderSummary.dart';
import 'package:whatsapp_clone/util/helper.dart';

import '../../util/constants.dart';
import '../favouriteScreen/favouriteScreen.dart';
import '../productDetailScreen/productDetailScreen.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

double totalCartPrice = 0;
List<Map<String, dynamic>> _cartIndex = [];

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 45,
                      fontFamily: 'Lobester'),
                ),
              ),
              Expanded(
                child: _cartIndex.isEmpty
                    ? Container(
                        height: helper.deviceHeight(context),
                        alignment: Alignment.center,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: helper.deviceHeight(context)*0.15),
                            const Icon(
                              Iconsax.emoji_sad,
                              size: 80,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Your Cart is empty',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: helper.deviceHeight(context) * 0.15),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, left: 10, bottom: 10),
                                child: GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                productDetailScreen(
                                                  name: constants.listData[
                                                      _cartIndex[index]
                                                          ['incart']]['name'],
                                                  type: constants.listData[
                                                      _cartIndex[index]
                                                          ['incart']]['type'],
                                                  description:
                                                      constants.listData[
                                                              _cartIndex[index]
                                                                  ['incart']]
                                                          ['description'],
                                                  imgPath: constants.listData[
                                                      _cartIndex[index]
                                                          ['incart']]['path'],
                                                  price: constants.listData[
                                                      _cartIndex[index]
                                                          ['incart']]['price'],
                                                  rating: constants.listData[
                                                      _cartIndex[index]
                                                          ['incart']]['rating'],
                                                  time: constants.listData[
                                                      _cartIndex[index]
                                                          ['incart']]['time'],
                                                  itemIndex: _cartIndex[index]
                                                      ['incart'],
                                                )));
                                    setState(() {
                                      _updatecartList();
                                    });
                                  },
                                  child: SizedBox(
                                    height: 130,
                                    child: Card(
                                      color: constants.softWhite,
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                '${constants.listData[_cartIndex[index]['incart']]['path']}.png',
                                                height: 100,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${constants.listData[_cartIndex[index]['incart']]['name']}',
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${constants.listData[_cartIndex[index]['incart']]['type']}'),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                      ),
                                                      Text(
                                                        constants.listData[
                                                                _cartIndex[
                                                                        index]
                                                                    ['incart']]
                                                            ['rating'],
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '\$${constants.listData[_cartIndex[index]['incart']]['price'] * constants.listData[_cartIndex[index]['incart']]['quantity']}',
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (constants.listData[
                                                                  _cartIndex[
                                                                          index]
                                                                      [
                                                                      'incart']]
                                                              ['quantity'] >
                                                          1) {
                                                        constants.listData[
                                                                _cartIndex[
                                                                        index]
                                                                    ['incart']]
                                                            ['quantity']--;
                                                      } else {
                                                        constants.listData[
                                                                _cartIndex[
                                                                        index]
                                                                    ['incart']]
                                                            ['incart'] = false;
                                                      }
                                                      setState(() {
                                                        _updatecartList();
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: constants.bg2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: const Icon(
                                                        Iconsax.minus,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      '${constants.listData[_cartIndex[index]['incart']]['quantity']}',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      constants.listData[
                                                              _cartIndex[index]
                                                                  ['incart']]
                                                          ['quantity']++;
                                                      setState(() {
                                                        _updatecartList();
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: constants.bg2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: const Icon(
                                                        Iconsax.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: _cartIndex.length,
                          ),
                        ),
                      ),
              ),
            ],
          ),
          Positioned(
              width: helper.deviceWidth(context),
              bottom: 40,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: constants.brown,
                        borderRadius: BorderRadius.circular(20)),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Total Bill = \$${totalCartPrice.toInt()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Times New Roman'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_cartIndex.isEmpty) {
                              helper.showToast("Your Cart is Empty",ToastGravity.CENTER);
                            } else {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return orderSummary(
                                      price: totalCartPrice.toInt(),
                                    );
                                  }));
                            }
                            }
                            ,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: constants.bg2, width: 2))),
                          child: Text(
                            "Pay Now",
                            style: TextStyle(color: constants.bg2),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _updatecartList();
    super.didChangeDependencies();
  }

  void _updatecartList() {
    _cartIndex.clear();
    totalCartPrice = 0;
    for (int i = 0; i < constants.listData.length; i++) {
      if (constants.listData[i]['incart'] == true) {
        totalCartPrice +=
            constants.listData[i]['price'] * constants.listData[i]['quantity'];
        _cartIndex.add({"incart": i});
      }
    }
  }
}
