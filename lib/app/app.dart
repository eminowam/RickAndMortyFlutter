import 'package:flutter/material.dart';
import 'package:rest_api_ram/config/app_color.dart';
import 'package:rest_api_ram/view/screens/home_page.dart';
import 'package:rest_api_ram/view/screens/storage_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "PlayFair"
      ),
      home: HomePage(title: "Rick and Morty"),
      // routes: {
      //   '/storage': (context) => StorageScreen(),
      // },
    );
  }
}
