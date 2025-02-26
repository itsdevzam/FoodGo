import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whatsapp_clone/util/constants.dart';

class helper {

  static double deviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width*1;
  }

  static double deviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height*1;
  }

  static void showToast(String msg,ToastGravity gravity){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: constants.bg2,
        textColor: CupertinoColors.white,
        fontSize: 16.0
    );
  }
}