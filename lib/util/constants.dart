import 'dart:ui';

import 'package:flutter/cupertino.dart';

class constants{
  //strings
  static String appName = "Foodgo";

  //colors
  static Color bg1 = const Color(0xFFFF939B);
  static Color bg2 = const Color(0xFFEF2A39);
  static Color grey = const Color(0xFF6A6A6A);
  static Color brown = const Color(0xFF3C2F2F);
  static Color softWhite = const Color(0xFFFAFAFA);

  //paths
  static String splashimg = "assets/images/splash";
  static String homeScreen = "assets/images/homeScreen";
  static String burgersImages = "assets/images/burgerImages";

  //List Categories
  static List<String> listCat = ["All","Combos","Sliders","Classic"];

  //List Data
  static List<Map<String,dynamic>> listData = [
    {"name":"Cheeseburger","type":"Cheeseburger","rating":"4.9","path":"$burgersImages/image6","quantity": 1,"incart":false,"price":52,"time":"14 minutes","isfav":true,"description":"The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles."},
    {"name":"Hamburger","type":"Veggie Burger","rating":"4.8","path":"$burgersImages/image5","quantity": 1,"incart":false,"price":10,"time":"17 minutes","isfav":false,"description":"Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. "},
    {"name":"Hamburger ","type":"Chicken Burger","rating":"4.6","path":"$burgersImages/image4","quantity": 1,"incart":false,"price":40,"time":"19 minutes","isfav":false,"description":"Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!"},
    {"name":"Hamburger ","type":"Fried Burger","rating":"4.2","path":"$burgersImages/image6","quantity": 1,"incart":false,"price":63,"time":"13 minutes","isfav":false,"description":"Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce."},
    {"name":"Cheeseburger","type":"Cheeseburger","rating":"4.9","path":"$burgersImages/image6","quantity": 1,"incart":false,"price":78,"time":"14 minutes","isfav":false,"description":"The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles."},
    {"name":"Hamburger","type":"Veggie Burger","rating":"4.8","path":"$burgersImages/image5","quantity": 1,"incart":false,"price":52,"time":"17 minutes","isfav":false,"description":"Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun. "},
    {"name":"Hamburger ","type":"Chicken Burger","rating":"4.6","path":"$burgersImages/image4","quantity": 1,"incart":false,"price":20,"time":"19 minutes","isfav":false,"description":"Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!"},
    {"name":"Hamburger ","type":"Fried Burger","rating":"4.2","path":"$burgersImages/image6","quantity": 1,"incart":true,"price":10,"time":"13 minutes","isfav":false,"description":"Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce."},
  ];

  //Message data
  static List<String> supportMessages = ["Hi, how can I help you?","Ok, please let me check!","It’ll get 25 minutes to arrive to your address"];
  static List<String> customerMessages = ["Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?","Sure... Am waiting","Ok, thanks you for your support"];


}