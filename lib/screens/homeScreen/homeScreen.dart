import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/screens/productDetailScreen/productDetailScreen.dart';
import 'package:whatsapp_clone/util/helper.dart';
import '../../util/constants.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

int _currentIndex = 0;
bool catVisible=false;
class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          constants.appName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 45,
                              fontFamily: 'Lobester'),
                        ),
                        Text(
                          "Order your favourite food!",
                          style: TextStyle(color: constants.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset('${constants.homeScreen}/profile.png'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          cursorColor: constants.bg2,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Iconsax.search_normal),
                            labelText: "Search",
                            floatingLabelStyle:
                                TextStyle(color: constants.grey),
                            labelStyle: TextStyle(color: constants.grey),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        if(catVisible){
                          catVisible=false;
                        }else{
                          catVisible=true;
                        }
                        setState(() {
                          print(catVisible.toString());
                        });
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: constants.bg2,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                          ),
                          child: catVisible?const Icon(
                            Iconsax.arrow_down_1,
                            color: Colors.white,
                          ):const Icon(
                            Iconsax.filter,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Visibility(
                  visible: catVisible?true:false,
                  child: SizedBox(
                    height: 60,
                    child: ListView.builder(
                      itemCount: constants.listCat.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 15),
                          child: _currentIndex == index
                              ? Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 5,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: constants.bg2,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 105,
                                      child: ListTile(
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          _currentIndex = index;
                                          setState(() {});
                                        },
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15.0),
                                          child: Center(
                                              child: Text(
                                            constants.listCat[index],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )),
                                        ),
                                      )),
                                )
                              : Material(
                                  borderRadius: BorderRadius.circular(20),
                                  // elevation: 5,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F6),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 105,
                                      child: ListTile(
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          _currentIndex = index;
                                          setState(() {});
                                        },
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 15.0),
                                          child: Center(
                                              child: Text(
                                            constants.listCat[index],
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )),
                                        ),
                                      )),
                                ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60.0, top: 20),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 1 / 1.45),
                          itemCount: constants.listData.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            productDetailScreen(
                                              name: constants.listData[index]
                                                  ['name'],
                                              type: constants.listData[index]
                                                  ['type'],
                                              description:
                                                  constants.listData[index]
                                                      ['description'],
                                              imgPath: constants.listData[index]
                                                  ['path'],
                                              price: constants.listData[index]
                                                  ['price'],
                                              rating: constants.listData[index]
                                                  ['rating'],
                                              time: constants.listData[index]
                                                  ['time'],
                                              itemIndex: index,
                                            )));
                              },
                              child: Card(
                                color: constants.softWhite,
                                elevation: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Center(
                                          child: Image.asset(
                                        "${constants.listData[index]['path']}.png",
                                        height: 120,
                                      )),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            constants.listData[index]['name'],
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                constants.listData[index]
                                                    ['type'],
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                    Text(
                                                      constants.listData[index]
                                                          ['rating'],
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0, left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${constants.listData[index]['price'].toString()}',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                constants.listData[index]
                                                        ['isfav']
                                                    ? constants.listData[index]
                                                        ['isfav'] = false
                                                    : constants.listData[index]
                                                        ['isfav'] = true;
                                                setState(() {});
                                              },
                                              icon: constants.listData[index]
                                                      ['isfav']
                                                  ? Icon(
                                                      Iconsax.heart5,
                                                      color: constants.bg2,
                                                    )
                                                  : const Icon(
                                                      Iconsax.heart,
                                                    )),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
