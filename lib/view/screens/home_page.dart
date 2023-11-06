import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_ram/bloc/character_bloc.dart';
import 'package:rest_api_ram/config/app_color.dart';
import 'package:rest_api_ram/data/repositories/character_repository.dart';
import 'package:rest_api_ram/view/screens/page_one.dart';
import 'package:rest_api_ram/view/screens/storage_screen.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final repository=CharacterRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white12,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500
          ),
        ),
        elevation: 2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        showSelectedLabels: false,
        selectedItemColor: AppColor.mainAppColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white30,
        items:const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // backgroundColor: Colors.black,
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              // backgroundColor: Colors.black,
              label: 'Storage'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: BlocProvider(
        create: (context)=>CharacterBloc(characterRepository: repository),
        child: Container(
          color: Colors.white12,
          child: Builder(
            builder: (context) {
              if (_currentIndex == 0) {
                return PageOne();
              } else if (_currentIndex == 1) {
                return StorageScreen();
              }
              return const SizedBox();
            },
          )
      ),
      ),
    );
  }
}
