import 'package:flutter/material.dart';
import 'package:rest_api_ram/data/models/character.dart';
import 'package:rest_api_ram/data_base/db_helper.dart';
import 'package:rest_api_ram/view/widgets/character_list_tile.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<List<int>>(
          future: DatabaseHelper.getSavedCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final savedCharacters = snapshot.data ?? [];

              return ListView.builder(
                itemCount: savedCharacters.length,
                itemBuilder: (context, index) {
                  final CharacterId = savedCharacters[index];
                  return CharacterListTile(result: Results(id: CharacterId, name: "",  status: "", species: "", gender: "",image: ""), characterId: CharacterId,);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
