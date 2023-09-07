import 'package:employees/cubit/employees_cubit.dart';
import 'package:employees/resources/strings_manager.dart';
import 'package:employees/resources/theme_manager.dart';
import 'package:employees/screens/employees_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsManager.employees,
      theme: getApplicationTheme(isLight: true),
      themeMode: ThemeMode.light,
      home: BlocProvider(
        create: (_) => EmployeesCubit(),
        child: const EmployeesScreen()
      ),
    );
  }
}