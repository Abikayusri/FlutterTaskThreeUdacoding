import 'package:flutter/material.dart';

import 'model/movie_list.dart';
import 'presentation/detail/movie_detail_screen.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/login/login_screen.dart';
import 'presentation/register/register_screen.dart';
import 'static/navigation_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) {
        return SafeArea(child: child ?? Container());
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: NavigationRoute.loginRoute.name,
      routes: {
        NavigationRoute.loginRoute.name: (context) => const LoginScreen(),
        NavigationRoute.registerRoute.name: (context) => const RegisterScreen(),
        NavigationRoute.homeRoute.name: (context) => HomeScreen(
          username: ModalRoute.of(context)?.settings.arguments as String,
        ),
        NavigationRoute.detailRoute.name: (context) => MovieDetailScreen(
          movie: ModalRoute.of(context)?.settings.arguments as MovieModel,
        ),
      },
    );
  }
}
