import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(result.name),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.white12,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 10,
              ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.circle,
                      size: 11,
                      color: liveState == LiveState.alive
                          ? Colors.lightGreenAccent[400]
                          : liveState == LiveState.dead
                          ? Colors.red
                          : Colors.blue),
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
                  )
                ],
              ),
             const SizedBox(
                height: 7,
              ),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                   const Text(
                     "Species:",
                     style: TextStyle(
                         color: Colors.orange,
                         fontSize: 16,
                         fontWeight: FontWeight.bold),
                   ),
                   const SizedBox(
                     width: 20,
                   ),
                   Text(
                     result.species,
                     overflow: TextOverflow.ellipsis,
                     style: const TextStyle(
                         color: Colors.black, fontSize: 18),
                   )
                 ],
               ),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
                   const Text(
                     "Gender:",
                     style: TextStyle(
                         color: Colors.orange,
                         fontSize: 16,
                         fontWeight: FontWeight.bold),
                   ),
                   const SizedBox(
                     width: 20,
                   ),
                   Text(
                     result.gender,
                     overflow: TextOverflow.ellipsis,
                     style: const TextStyle(
                         color: Colors.black, fontSize: 18),
                   ),
                 ],
               ),
             const Text(
                  "Description:",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),),
             const SizedBox(
               height: 6,
             ),
             const  Text(
                "    Rick and Morty is the Emmy award-winning half-hour animated "
                    "hit comedy series on Adult Swim that follows a sociopathic "
                    "genius scientist who drags his inherently timid grandson on "
                    "insanely dangerous adventures across the universe. Rick Sanchez "
                    "is living with his daughter Beth’s family and constantly bringing "
                    "her, his son-in-law Jerry, granddaughter "
                    "Summer, and grandson Morty into intergalactic escapades. ",
                style:  TextStyle(
                    color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
