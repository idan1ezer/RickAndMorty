import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_event.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_state.dart';
import '../../../../domain/usecases/get_all_characters.dart';

class RemoteCharacterBloc extends Bloc<RemoteCharacterEvent, RemoteCharacterState> {
  final GetAllCharactersUseCase _getAllCharactersUseCase;

  RemoteCharacterBloc(this._getAllCharactersUseCase) : super(const RemoteCharacterLoading()) {
    on <GetCharacters> (onGetCharacters);
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
}