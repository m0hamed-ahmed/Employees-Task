import 'package:employees/model/user_model.dart';
import 'package:employees/resources/strings_manager.dart';
import 'package:employees/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserInfo extends StatelessWidget {
  final UserModel user;

  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width * 0.30) - 10 - 16,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorsManager.color2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: ColorsManager.color4,
            ),
            child: Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: false,
                onChanged: (val) {},
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: ColorsManager.color4,
                      child: Icon(Icons.person, color: ColorsManager.color1, size: 30),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ColorsManager.color4, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            user.company.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ColorsManager.color4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: ColorsManager.color4, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text:user.email));
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${StringsManager.emailCopied}: ${user.email}'), backgroundColor: ColorsManager.green));
                        },
                        icon: Icon(Icons.email, color: ColorsManager.color4, size: 16),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: user.phone));
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${StringsManager.phoneCopied}: ${user.phone}'), backgroundColor: ColorsManager.green));
                        },
                        icon: Icon(Icons.phone, color: ColorsManager.color4, size: 16),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}