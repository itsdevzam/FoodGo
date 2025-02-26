import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/screens/splashScreen/splashScreen.dart';
import 'package:whatsapp_clone/util/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: constants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: constants.bg2),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const splashScreen(),
    );
  }
}

