import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/view/home_page.dart';

class EmotionWidget extends StatelessWidget {
  const EmotionWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CapturePage(),
    );
  }
}
