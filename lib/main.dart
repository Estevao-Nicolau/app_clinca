import 'package:app_clinica/constants/theme.dart';
import 'package:app_clinica/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consultorio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: tBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: tPrimaryColor),
        primarySwatch: Colors.cyan,
      ),
      home: const LoginPage(),
    );
  }
}
