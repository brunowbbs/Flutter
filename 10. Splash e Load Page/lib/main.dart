import 'package:flutter/material.dart';
import 'package:splash/pages/details_page.dart';
import 'package:splash/pages/home_page.dart';
import 'package:splash/pages/login_page.dart';
import 'package:splash/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        initialRoute: "/splash",
        routes: {
          '/splash': (_) => const SplashPage(),
          '/login': (_) => LoginPage(),
          '/home': (_) => const HomePage(),
          '/details': (_) => const DetailsPage()
        });
  }
}
