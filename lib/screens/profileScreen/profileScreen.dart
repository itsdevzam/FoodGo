import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/util/constants.dart';
import 'package:whatsapp_clone/util/helper.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController(text: "DevZam");
    final TextEditingController _emailController = TextEditingController(text: 'itsdevzam@gmail.com');
    final TextEditingController _deliveryController = TextEditingController(text: '123 Main St Apartment 4A,New York, NY');
    final TextEditingController _passController = TextEditingController(text: 'devamPassword');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: constants.bg2,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(onPressed: (){}, icon: const Icon(Iconsax.setting,color: Colors.white,)),
          ),
        ],
      ),
      backgroundColor: constants.bg2,
      body: SafeArea(
        child: Container(
          color: constants.bg2,
          width: helper.deviceWidth(context),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30)),
                  ),
                  width: helper.deviceWidth(context),
                  height: helper.deviceHeight(context)*0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: helper.deviceHeight(context)*0.1,),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0,left: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: constants.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  labelText: "Name",
                                  contentPadding: const EdgeInsets.only(left: 20,top: 18,bottom: 18),
                                ),
                                controller: _nameController,
                                cursorColor: constants.bg2,
                              ),
                              const SizedBox(height: 25,),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: constants.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  labelText: "Email",
                                  contentPadding: const EdgeInsets.only(left: 20,top: 18,bottom: 18),
                                ),
                                controller: _emailController,
                                cursorColor: constants.bg2,
                              ),
                              const SizedBox(height: 25,),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: constants.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  labelText: "Delivery Adress",
                                  contentPadding: const EdgeInsets.only(left: 20,top: 18,bottom: 18),
                                ),
                                controller: _deliveryController,
                                cursorColor: constants.bg2,
                              ),
                              const SizedBox(height: 25,),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: constants.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: constants.grey),
                                  ),
                                  labelText: "Password",
                                  contentPadding: const EdgeInsets.only(left: 20,top: 18,bottom: 18),
                                ),
                                obscureText: true,
                                controller: _passController,
                                cursorColor: constants.bg2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0,left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Payment Details"),
                                  IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_1))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30.0,left: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Order History"),
                                  IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_1))
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                width: helper.deviceWidth(context)*0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: constants.brown,
                                ),
                                height: 70,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  Text("Edit Profile",style: TextStyle(color: Colors.white,fontSize: 16),),
                                  Icon(Iconsax.edit,color: Colors.white,)
                                ],),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                width: helper.deviceWidth(context)*0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  border: Border.all(color: constants.bg2,width: 2)
                                ),
                                height: 70,
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Logout",style: TextStyle(color: constants.bg2,fontSize: 16),),
                                    Icon(Iconsax.logout_1,color: constants.bg2,)
                                  ],),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40,),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: helper.deviceHeight(context)*0.001,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: constants.bg2,width: 3),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    width: 140,
                    height: 140,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/images/profileScreen/profile.png')),
                  ),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
