import 'package:flutter/material.dart';
import 'package:flutter_application_1/constraints/constant.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/loading_screen.dart';
import 'package:flutter_application_1/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color.fromARGB(255, 249, 247, 249),
        appBarTheme: AppBarTheme(color: kPrimaryColor),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/homeScreen': (context) => const HomeScreen(),
        '/searchScreen': (context) => const SearchScreen(),
      },
    );
  }
}
