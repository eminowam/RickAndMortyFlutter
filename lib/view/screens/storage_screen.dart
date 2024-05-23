import 'package:flutter/material.dart';
import 'package:rest_api_ram/data/models/character.dart';
import 'package:rest_api_ram/data/repositories/character_repository.dart';
import 'package:rest_api_ram/data_base/db_helper.dart';
import 'package:rest_api_ram/view/widgets/storage_list_tile.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({super.key});

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final CharacterRepository repository = CharacterRepository();
  late DatabaseHelper databaseHelper;

  @override
  void initState() {
    initPref();
    super.initState();
  }

  List<int> ids = [];
  bool isLoading = true;

  initPref() async {
    databaseHelper = DatabaseHelper();
    await databaseHelper.initSharedPref();
    ids = databaseHelper.getSavedCharacters();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return const CircularProgressIndicator();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder<List<Results>>(
          future: repository.getSaveCharacterById(ids),
          builder: (context, index1) {
            if (index1.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (index1.hasError) {
              return const Center(
                  child: Text(
                'Storage is empty',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ));
            } else {
              final list = index1.data ?? [];

              return ListView.separated(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = list[index];
                  return StorageListTile(
                    result: Results(
                        id: item.id,
                        name: item.name,
                        status: item.status,
                        species: item.species,
                        gender: item.gender,
                        image: item.image),
                    characterId: item.id,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                  height: 5,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
