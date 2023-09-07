import 'package:employees/cubit/employees_cubit.dart';
import 'package:employees/cubit/employees_state.dart';
import 'package:employees/resources/colors_manager.dart';
import 'package:employees/widgets/employee_item_view.dart';
import 'package:employees/widgets/my_app_bar.dart';
import 'package:employees/widgets/search_section.dart';
import 'package:employees/widgets/sort_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  late EmployeesCubit _employeesCubit;

  @override
  void initState() {
    super.initState();
    _employeesCubit = EmployeesCubit.get(context);
    _employeesCubit.getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.color1,
      body: BlocBuilder<EmployeesCubit, EmployeesState>(
        builder: (context, state) {
          if(state is LoadingGetEmployeesState) {
            return const Center(child: CircularProgressIndicator(color: ColorsManager.white));
          }
          if(state is ErrorGetEmployeesState) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(color: ColorsManager.red700, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: ColorsManager.color1,
                floating: true,
                title: const MyAppBar(),
              ),
              SliverToBoxAdapter(child: Divider(color: ColorsManager.color4)),
              const SliverToBoxAdapter(child: SizedBox(height: 5)),
              const SliverToBoxAdapter(child: SearchSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              const SliverToBoxAdapter(child: SortSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList.separated(
                  itemBuilder: (context, employeeIndex) => EmployeeItemView(employee: _employeesCubit.employees[employeeIndex]),
                  separatorBuilder: (context, _) => const SizedBox(height: 15),
                  itemCount: _employeesCubit.employees.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}












