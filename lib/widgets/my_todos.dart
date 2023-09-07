import 'package:employees/model/todo_model.dart';
import 'package:employees/resources/strings_manager.dart';
import 'package:employees/resources/colors_manager.dart';
import 'package:employees/widgets/custom_dropdown_button_form_field.dart';
import 'package:flutter/material.dart';

class MyTodos extends StatelessWidget {
  final List<TodoModel> todos;

  const MyTodos({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.sizeOf(context).width * 0.70) - 10 - 16,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorsManager.color2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(100),
          3: FixedColumnWidth(100),
        },
        border: TableBorder(
          horizontalInside: BorderSide(width: 1, color: ColorsManager.color4, style: BorderStyle.solid),
          verticalInside: BorderSide(width: 1, color: ColorsManager.color4, style: BorderStyle.solid),
        ),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: ColorsManager.color3,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    StringsManager.todoId.toUpperCase(),
                    style: TextStyle(color: ColorsManager.color4, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    StringsManager.permissions.toUpperCase(),
                    style: TextStyle(color: ColorsManager.color4, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    StringsManager.title.toUpperCase(),
                    style: TextStyle(color: ColorsManager.color4, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Text(
                    StringsManager.action.toUpperCase(),
                    style: TextStyle(color: ColorsManager.color4, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          ...List.generate(todos.length, (todoIndex) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      todos[todoIndex].id.toString(),
                      style: TextStyle(color: ColorsManager.color4, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomDropdownButtonFormField(
                    currentValue: todos[todoIndex].completed.toString().toUpperCase(),
                    valuesText: const ['TRUE', 'FALSE'],
                    valuesObject: const ['TRUE', 'FALSE'],
                    onChanged: (val) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    todos[todoIndex].title,
                    style: TextStyle(color: ColorsManager.color4, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add, color: ColorsManager.blue, size: 16),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: ColorsManager.green, size: 16),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100),
                      clipBehavior: Clip.antiAlias,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete, color: ColorsManager.red700, size: 16),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}