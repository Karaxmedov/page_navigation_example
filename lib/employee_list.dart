import 'package:flutter/material.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Employee> employeeList =
        ModalRoute.of(context)!.settings.arguments as List<Employee>;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Title"),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/employeeDetail",
                      arguments: employeeList[index]);
                },
                leading: CircleAvatar(
                    child: Text(employeeList[index].id.toString())),
                title: Text(employeeList[index].name),
                subtitle: Text(employeeList[index].surname),
              );
            },
            itemCount: employeeList.length,
          ),
        ));
  }
}

class Employee {
  final int id;
  final String name;
  final String surname;

  Employee(this.id, this.name, this.surname);
}
