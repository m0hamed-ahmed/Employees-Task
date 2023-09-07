import 'package:employees/resources/strings_manager.dart';
import 'package:employees/resources/colors_manager.dart';
import 'package:employees/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SortSection extends StatelessWidget {
  const SortSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CustomButton(
            buttonType: ButtonType.postIcon,
            text: StringsManager.sortBy,
            iconData: Icons.import_export,
            buttonColor: ColorsManager.color2,
            textColor: ColorsManager.color4,
            iconColor: ColorsManager.color4,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
          const SizedBox(width: 10),
          CustomButton(
            buttonType: ButtonType.postIcon,
            text: StringsManager.filter,
            iconData: Icons.filter_list,
            buttonColor: ColorsManager.color2,
            textColor: ColorsManager.color4,
            iconColor: ColorsManager.color4,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}