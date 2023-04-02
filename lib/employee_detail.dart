import 'package:flutter/material.dart';

import 'employee_list.dart';

class EmployeeDetail extends StatelessWidget {
  final Employee employee;
  const EmployeeDetail({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
            color: Colors.cyan,
            child: Text(
              "${employee.id}",
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Card(
            color: Colors.cyan,
            margin: const EdgeInsets.all(50),
            child: Text(
              employee.name,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          Card(
            color: Colors.cyan,
            child: Text(
              employee.surname,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
