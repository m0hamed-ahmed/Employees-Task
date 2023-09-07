import 'package:employees/cubit/employees_state.dart';
import 'package:employees/model/employee_model.dart';
import 'package:employees/model/todo_model.dart';
import 'package:employees/model/user_model.dart';
import 'package:employees/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  EmployeesCubit() : super(EmployeesInitialState());

  static EmployeesCubit get(context) => BlocProvider.of<EmployeesCubit>(context);

  List<EmployeeModel> employees = [];
  Future<void> getEmployees() async {
    try {
      emit(LoadingGetEmployeesState());
      Response todosResponse = await Dio().get(ConstantsManager.todosEndPoint);
      Response usersResponse = await Dio().get(ConstantsManager.usersEndPoint);
      if (todosResponse.statusCode == 200 && usersResponse.statusCode == 200) {
        List<TodoModel> todos = [];
        for(int i=0; i<todosResponse.data.length; i++) {
          todos.add(TodoModel.fromJson(todosResponse.data[i]));
        }
        for(int i=0; i<usersResponse.data.length; i++) {
          UserModel userModel = UserModel.fromJson(usersResponse.data[i]);
          EmployeeModel employeeModel = EmployeeModel(
            user: userModel,
            todos: todos.where((element) => element.userId == userModel.id).toList(),
          );
          employees.add(employeeModel);
        }
        emit(SuccessGetEmployeesState());
      }
      else {
        emit(ErrorGetEmployeesState(error: 'An Error Occurred. Try Again'));
      }
    }
    catch (e) {
      emit(ErrorGetEmployeesState(error: 'An Error Occurred. Try Again'));
    }
  }
}