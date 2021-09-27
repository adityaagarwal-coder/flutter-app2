import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/homepage.dart';
import 'package:flutter_application_3/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {MyRoutes.homeroute: (context) => HomePage()},
    );
  }
}
