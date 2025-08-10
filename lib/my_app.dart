import 'package:flutter/material.dart';
import 'package:tasks/features/home/view/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
    );
  }
}
