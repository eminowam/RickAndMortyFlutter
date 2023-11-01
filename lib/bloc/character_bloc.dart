import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rest_api_ram/data/models/character.dart';
import 'package:rest_api_ram/data/repositories/character_repository.dart';


part 'character_bloc.freezed.dart';
// part 'character_bloc.g.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent,CharacterState>{
  final CharacterRepository characterRepository;
  CharacterBloc({required this.characterRepository}): super(const CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(const CharacterState.loading());
      try{
        Character _characterLoaded=
            await characterRepository.getCharacter(event.page, event.name);
        emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      }catch(_){
        emit(const CharacterState.error());
      }

    });
  }
}
