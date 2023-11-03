import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_ram/data/models/character.dart';
import 'package:rest_api_ram/view/screens/details.dart';
import 'package:rest_api_ram/view/widgets/character_status.dart';

class CharacterListTile extends StatelessWidget {
  final Results result;

  const CharacterListTile({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
            border: Border.all(color: Colors.grey.withOpacity(0.6)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(1.0),
                  blurRadius: 8,
                  offset: Offset(0, 9))
            ]),
        height: MediaQuery.of(context).size.height / 7,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                        result: result,
                        liveState: result.status == "Alive"
                            ? LiveState.alive
                            : result.status == "Dead"
                                ? LiveState.dead
                                : LiveState.unknown,
                      )),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: result.image,
                placeholder: (
                  context,
                  url,
                ) =>
                    const CircularProgressIndicator(
                  color: Colors.green,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            result.name,
                            style: const  TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          InkWell(
                            child: const Icon(Icons.bookmark,
                            size: 15,),
                            onTap: (){

                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CharacterStatus(
                        liveState: result.status == 'Alive'
                            ? LiveState.alive
                            : result.status == 'Dead'
                                ? LiveState.dead
                                : LiveState.unknown),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Species: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                result.species,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Gender: ",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                result.gender,
                                style:const  TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
