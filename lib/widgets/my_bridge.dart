import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class MyBridge extends StatelessWidget {
  const MyBridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 10,
      color: ColorsManager.color2,
      margin: const EdgeInsets.only(top: 50),
    );
  }
}