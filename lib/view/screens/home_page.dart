import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_ram/bloc/character_bloc.dart';
import 'package:rest_api_ram/config/app_color.dart';
import 'package:rest_api_ram/data/repositories/character_repository.dart';
import 'package:rest_api_ram/view/screens/page_one.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key, required this.title});

  final String title;
  final repository=CharacterRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.mainAppColor,
        title: Text(
          title,
        ),
        elevation: 5,
      ),
      body: BlocProvider(
        create: (context)=>CharacterBloc(characterRepository: repository),
        child: Container(
          color: AppColor.matherialColor,
            child: const PageOne()),
      ),
    );
  }
}
