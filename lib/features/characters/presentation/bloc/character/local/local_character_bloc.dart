import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_saved_character.dart';
import '../../../../domain/usecases/remove_character.dart';
import '../../../../domain/usecases/save_character.dart';
import 'local_character_event.dart';
import 'local_character_state.dart';

class LocalCharacterBloc extends Bloc<LocalCharacterEvent, LocalCharacterState> {
  final GetSavedCharactersUseCase _getSavedCharactersUseCase;
  final RemoveCharactersUseCase _removeCharactersUseCase;
  final SaveCharactersUseCase _saveCharactersUseCase;

  LocalCharacterBloc(
    this._getSavedCharactersUseCase,
    this._removeCharactersUseCase,
    this._saveCharactersUseCase,
  ) : super(const LocalCharacterLoading()) {
    on<GetSavedCharacters>(onGetSavedCharacters);
    on<RemoveCharacter>(onRemoveCharacter);
    on<SaveCharacter>(onSaveCharacter);
  }

  void onGetSavedCharacters(GetSavedCharacters event, Emitter<LocalCharacterState> emit) async {
    final characters = await _getSavedCharactersUseCase();
    emit(LocalCharacterDone(characters));
  }

  void onRemoveCharacter(RemoveCharacter removeCharacter, Emitter<LocalCharacterState> emit) async {
    await _removeCharactersUseCase(params: removeCharacter.character);
    final characters = await _getSavedCharactersUseCase();
    emit(LocalCharacterDone(characters));
  }

  void onSaveCharacter(SaveCharacter saveCharacter, Emitter<LocalCharacterState> emit) async {
    await _saveCharactersUseCase(params: saveCharacter.character);
    final characters = await _getSavedCharactersUseCase();
    emit(LocalCharacterDone(characters));
  }
}
