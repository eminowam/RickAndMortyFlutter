import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_new/pull_to_refresh.dart';
import 'package:rest_api_ram/bloc/character_bloc.dart';
import 'package:rest_api_ram/config/app_color.dart';
import 'package:rest_api_ram/data/models/character.dart';
import 'package:rest_api_ram/view/widgets/character_list_tile.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {


  @override
  void initState() {
    if (_currentResult.isEmpty) {
      context
          .read<CharacterBloc>()
          .add(const CharacterEventFetch(name: "", page: 1));
    }
    super.initState();
  }
  late Character _currentCharacter;
  List<Results> _currentResult = [];
  int _currentPage = 1;
  String _currentSearch = '';

  final RefreshController refreshController=RefreshController();
  bool _isPagination= false;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CharacterBloc>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, right: 16, left: 16),
          child: TextField(
            style: const TextStyle(color: Colors.black),
            cursorColor: Colors.white,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.mainAppColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                prefixIcon: const  Icon(
                  Icons.search,
                  color: Colors.white38,
                ),
                hintText: "Поиск по имени",
                hintStyle: const TextStyle(color: Colors.white38,
                fontSize: 15,)),
            onChanged: (value) {
              _currentPage = 1;
              _currentResult = [];
              _currentSearch = value;
              context
                  .read<CharacterBloc>()
                  .add(CharacterEvent.fetch(name: value, page: _currentPage));
            },
          ),
        ),
        Expanded(
          child: state.when(
            loading: () {
              if(!_isPagination) {
                return const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Loading...")
                    ],
                  ),
                );
              }else{
                return _customListView(_currentResult);
              }
            },
            loaded: (characterLoaded) {
              _currentCharacter = characterLoaded;
              if(_isPagination){
                _currentResult.addAll(_currentCharacter.results);
                refreshController.loadComplete();
                _isPagination=false;
              }else{
                _currentResult = _currentCharacter.results;
              }
              return _currentResult.isNotEmpty
                  ? _customListView(_currentResult)
                  : const SizedBox();
            },
            error: () => const Text("Nothing found..."),
          ),
        ),
      ],
    );
  }

  Widget _customListView(List<Results> currentResults){
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: (){
        // _isPagination = true;
        _currentPage++;
        if(_currentPage <=_currentCharacter.info.pages){
          context.read<CharacterBloc>()
              .add(CharacterEvent.fetch(name: _currentSearch, page: _currentPage));
        }else{
          refreshController.loadNoData();
        }
      },
      child: ListView.separated(
          itemBuilder: (context,index){
            final result = currentResults[index];
            return Padding(
              padding: const EdgeInsets.only(top: 3,bottom: 3,left: 15,right: 15),
              child: CharacterListTile(result: result,),
            );
          },
          separatorBuilder: (_,index)=> const SizedBox(height: 5,),
          itemCount: currentResults.length,
      shrinkWrap: true,),
    );

  }
}
