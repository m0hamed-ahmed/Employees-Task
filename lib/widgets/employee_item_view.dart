import 'package:employees/model/employee_model.dart';
import 'package:employees/widgets/my_bridge.dart';
import 'package:employees/widgets/my_todos.dart';
import 'package:employees/widgets/user_info.dart';
import 'package:flutter/material.dart';

class EmployeeItemView extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeItemView({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(user: employee.user),
        const MyBridge(),
        MyTodos(todos: employee.todos),
      ],
    );
  }
}