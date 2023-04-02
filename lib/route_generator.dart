import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_navigation_example/blue_page.dart';
import 'package:page_navigation_example/employee_detail.dart';
import 'package:page_navigation_example/employee_list.dart';
import 'package:page_navigation_example/green_page.dart';
import 'package:page_navigation_example/main.dart';
import 'package:page_navigation_example/red_page.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return createRoute(const HomePage(), settings);

      case "/greenPage":
        return createRoute(const GreenPage(), settings);
      case "/bluePage":
        return createRoute(BluePage(), settings);
      case "/redPage":
        return createRoute(const RedPage(), settings);
      case "/employeeList":
        return createRoute(const EmployeeList(), settings);
      case "/employeeDetail":
        return createRoute(
            EmployeeDetail(employee: settings.arguments as Employee), settings);
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(
                "404 Not Found",
              ),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> createRoute(Widget widget, RouteSettings settings) {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => widget,
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => widget,
      );
    }
  }
}
