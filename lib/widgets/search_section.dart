import 'package:employees/resources/strings_manager.dart';
import 'package:employees/resources/colors_manager.dart';
import 'package:employees/widgets/custom_button.dart';
import 'package:employees/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.25,
            height: 30,
            child: CustomTextFormField(
              prefixIcon: Icon(Icons.search, color: ColorsManager.color4, size: 20),
              hintText: StringsManager.search,
              borderColor: ColorsManager.color3,
              fillColor: ColorsManager.color3,
              hintColor: ColorsManager.color4,
            ),
          ),
          const SizedBox(width: 10),
          CustomButton(
            buttonType: ButtonType.text,
            text: StringsManager.search,
            buttonColor: ColorsManager.color1,
            borderColor: ColorsManager.color2,
          ),
          const Spacer(),
          CustomButton(
            buttonType: ButtonType.postIcon,
            text: StringsManager.createNew.toUpperCase(),
            iconData: Icons.add,
            buttonColor: ColorsManager.green,
            textFontWeight: FontWeight.bold,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ],
      ),
    );
  }
}