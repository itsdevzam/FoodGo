import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whatsapp_clone/screens/cartScreen/cartScreen.dart';
import 'package:whatsapp_clone/screens/favouriteScreen/favouriteScreen.dart';
import 'package:whatsapp_clone/screens/homeScreen/homeScreen.dart';
import 'package:whatsapp_clone/screens/messageScreen/messageScreen.dart';
import 'package:whatsapp_clone/screens/profileScreen/profileScreen.dart';
import '../../util/constants.dart';

class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

Widget currentScreen = const homeScreen();
int currentIndex = 1;

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {
    void switchScreen(int index) {
      currentIndex = index;
      switch (index) {
        case 1:
          currentScreen = const homeScreen();
          break;
        case 2:
          currentScreen = const messageScreen();
          break;
        case 3:
          currentScreen = const favouriteScreen();
          break;
        case 4:
          currentScreen = const profileScreen();
          break;
        case 5:
          currentScreen = const cartScreen();
          break;
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: currentScreen,
      floatingActionButton: Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: FloatingActionButton(
            backgroundColor: constants.bg2,
            onPressed: () {
              switchScreen(5);
              setState(() {});
            },
            child: currentIndex == 5 ? CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Iconsax.shopping_cart,
                color: constants.bg2,
              ),
            ):const Icon(
              Iconsax.shopping_cart,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: constants.bg2,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  switchScreen(1);
                  setState(() {});
                },
                icon: currentIndex == 1
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Iconsax.home,
                          color: constants.bg2,
                          size: 27,
                        ),
                      )
                    : const Icon(
                        Iconsax.home,
                        color: Colors.white,
                        size: 27,
                      )),
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: IconButton(
                  onPressed: () {
                    switchScreen(2);
                    setState(() {});
                  },
                  icon: currentIndex == 2
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Iconsax.message,
                            color: constants.bg2,
                            size: 27,
                          ),
                        )
                      : const Icon(
                          Iconsax.message,
                          color: Colors.white,
                          size: 27,
                        )),
            ),
            IconButton(
                onPressed: () {
                  switchScreen(3);
                  setState(() {});
                },
                icon: currentIndex == 3
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Iconsax.heart,
                          color: constants.bg2,
                          size: 27,
                        ),
                      )
                    : const Icon(
                        Iconsax.heart,
                        color: Colors.white,
                        size: 27,
                      )),
            IconButton(
                onPressed: () {
                  switchScreen(4);
                  setState(() {});
                },
                icon: currentIndex == 4
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Iconsax.user_edit,
                          color: constants.bg2,
                          size: 27,
                        ),
                      )
                    : const Icon(
                        Iconsax.user_edit,
                        color: Colors.white,
                        size: 27,
                      )),
          ],
        ),
      ),
    );
  }
}
