import 'package:flutter/material.dart';
import 'package:rest_api_ram/view/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PlayFair"
      ),
      home: HomePage(),
    );
  }
}
