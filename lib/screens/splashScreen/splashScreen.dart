import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/bottomNavBar/bottomNavBar.dart';
import 'package:whatsapp_clone/screens/homeScreen/homeScreen.dart';
import 'package:whatsapp_clone/util/constants.dart';
import 'package:whatsapp_clone/util/helper.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = helper.deviceWidth(context);
    double deviceHeight = helper.deviceHeight(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [constants.bg1, constants.bg2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: deviceHeight * 0.25),
              child:  Center(
                    child: Text(
                  constants.appName,
                  style: const TextStyle(
                      fontFamily: 'Lobester',
                      fontSize: 50,
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(left: 0,bottom: 0,child: Image.asset('${constants.splashimg}/burger2.png'),),
            Positioned(left: deviceHeight*0.125,bottom: 0,child: Image.asset('${constants.splashimg}/shadow.png'),),
            Positioned(left:deviceWidth*0.3,bottom: 0,child: Image.asset('${constants.splashimg}/burger1.png'),),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3),()=>{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const bottomNavBar();
      })),
    });
    super.initState();
  }
}
