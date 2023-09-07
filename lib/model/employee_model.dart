import 'package:employees/model/todo_model.dart';
import 'package:employees/model/user_model.dart';

class EmployeeModel {
  late UserModel user;
  late List<TodoModel> todos;

  EmployeeModel({
    required this.user,
    required this.todos,
  });
}