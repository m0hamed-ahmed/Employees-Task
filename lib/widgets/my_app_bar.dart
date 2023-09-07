import 'package:employees/resources/strings_manager.dart';
import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringsManager.employees,
          style: TextStyle(color: ColorsManager.color4, fontSize: 20),
        ),
        Row(
          children: [
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings, color: ColorsManager.white),
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                padding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(width: 10),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
              clipBehavior: Clip.antiAlias,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none, color: ColorsManager.white),
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                padding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: ColorsManager.color2,
                  child: const Icon(Icons.person, color: ColorsManager.white, size: 20),
                ),
                const SizedBox(width: 10),
                Text(
                  'Mohamed Ahmed',
                  style: TextStyle(color: ColorsManager.color4, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}