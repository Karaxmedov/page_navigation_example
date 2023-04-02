import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_navigation_example/blue_page.dart';
import 'package:page_navigation_example/employee_list.dart';
import 'package:page_navigation_example/green_page.dart';
import 'package:page_navigation_example/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: const HomePage(),
      /* routes: {
        "/redPage": (context) => const RedPage(),
        "/greenPage": (context) => const GreenPage(),
        "/": (context) => const HomePage(),
      }, */
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => BluePage()))
                    .then((value) => debugPrint("$value"));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Go to Blue Page,Andorid",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                int a = await Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => BluePage()));
                debugPrint("$a");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "Go to Blue Page,Ios",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                "May be pop",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const GreenPage()));
              },
              child: const Text(
                "Push Replacement",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/redPage");
              },
              child: const Text(
                "Push Named Go to Red Page",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/greenPage");
              },
              child: const Text(
                "Push Named Go to Green Page",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/Page");
              },
              child: const Text(
                "Push Named Go to Unknown Page",
                style: TextStyle(fontSize: 24),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/employeeList", arguments: [
                  Employee(1, "Nicat", "Kara"),
                  Employee(2, "Adam", "Jan"),
                  Employee(1, "Jack", "Mardin")
                ]);
              },
              child: const Text(
                "Create List",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
