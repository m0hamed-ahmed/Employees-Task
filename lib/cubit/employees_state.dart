abstract class EmployeesState {}

class EmployeesInitialState extends EmployeesState {}

class LoadingGetEmployeesState extends EmployeesState {}
class SuccessGetEmployeesState extends EmployeesState {}
class ErrorGetEmployeesState extends EmployeesState {
  final String error;

  ErrorGetEmployeesState({required this.error});
}