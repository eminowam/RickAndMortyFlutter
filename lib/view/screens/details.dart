import 'package:flutter/material.dart';
import 'package:rest_api_ram/config/app_color.dart';
import 'package:rest_api_ram/data/models/character.dart';
import 'package:rest_api_ram/view/widgets/character_status.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(
      {super.key, required this.liveState, required this.result});

  final Results result;
  final LiveState liveState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.matherialColor,
      appBar: AppBar(
        title: const Text('Rick and Morty'),
        backgroundColor: AppColor.mainAppColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: Container(
            width: 500,
            height: 600,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white38,
                border: Border.all()),
            child: Center(
              child: Column(
                children: [
                  Image.network(
                    result.image,
                    width: double.infinity,
                  ),
                  Text(
                    result.name,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle,
                          size: 11,
                          color: liveState == LiveState.alive
                              ? Colors.lightGreenAccent[400]
                              : liveState == LiveState.dead
                                  ? Colors.red
                                  : Colors.white),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        liveState == LiveState.alive
                            ? "Alive"
                            : liveState == LiveState.dead
                                ? "Dead"
                                : "Unknown",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Species:",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        result.species,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Gender:",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        result.gender,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
