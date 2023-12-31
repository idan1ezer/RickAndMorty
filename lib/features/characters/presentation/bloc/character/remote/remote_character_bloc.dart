import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_state.dart';
import '../../../../domain/usecases/get_all_characters.dart';
import '../../../../domain/usecases/get_single_character.dart';

class RemoteCharacterBloc extends Bloc<RemoteCharacterEvent, RemoteCharacterState> {
  final GetAllCharactersUseCase _getAllCharactersUseCase;
  final GetSingleCharacterUseCase _getSingleCharacterUseCase;

  RemoteCharacterBloc(this._getAllCharactersUseCase, this._getSingleCharacterUseCase) : super(const RemoteCharacterLoading()) {
    on <GetCharacters> (onGetCharacters);
    on <GetSingleCharacter> (onGetSingleCharacter);
  }

  void onGetCharacters(GetCharacters event, Emitter<RemoteCharacterState> emit) async{
    final dataState = await _getAllCharactersUseCase.call();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteCharacterDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
        RemoteCharacterException(dataState.exception!)
      );
    }
  }

  void onGetSingleCharacter(GetSingleCharacter character, Emitter<RemoteCharacterState> emit) async{
    final dataState = await _getSingleCharacterUseCase.call(params: character.character);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(
          RemoteCharacterDone([dataState.data!])
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemoteCharacterException(dataState.exception!)
      );
    }
  }
}