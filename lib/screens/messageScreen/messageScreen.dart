import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/util/helper.dart';

import '../../util/constants.dart';

class messageScreen extends StatefulWidget {
  const messageScreen({super.key});

  @override
  State<messageScreen> createState() => _messageScreenState();
}

class _messageScreenState extends State<messageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Positioned(
            top: 0,
            width: helper.deviceWidth(context),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Messages",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 45,
                        fontFamily: 'Lobester'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: helper.deviceWidth(context),
                  height: helper.deviceHeight(context),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        int l1 = index ~/ 2;
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0,),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 22,
                                child: Icon(Iconsax.message_text),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: helper.deviceWidth(context)*0.6,
                                decoration: BoxDecoration(
                                  color: constants.grey,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(constants.supportMessages[l1],style: const TextStyle(color: Colors.white,fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        int l2 = index ~/ 2;
                        return Padding(
                          padding: const EdgeInsets.only(left:  20.0,top: 25,bottom: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: constants.bg2,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(constants.customerMessages[l2],style: const TextStyle(color: Colors.white,fontSize: 15),),
                                    ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                               CircleAvatar(
                                radius: 22,
                                child: Image.asset('${constants.homeScreen}/profile.png'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    itemCount: constants.supportMessages.length +
                        constants.customerMessages.length,
                  ),
                ),
              ],
            )),
        Positioned(
            width: helper.deviceWidth(context),
            bottom: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: helper.deviceWidth(context) * 0.7,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15.0, right: 10, left: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Write your Message Here!",
                        hintStyle: TextStyle(color: constants.grey),
                        border: InputBorder.none,
                      ),
                      cursorColor: constants.bg2,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: constants.bg2,
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: Container(
                    width: helper.deviceWidth(context) * 0.2,
                    height: 80,
                    decoration: BoxDecoration(
                      color: constants.bg2,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: const Icon(
                      Iconsax.send_2,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ],
    )));
  }
}
