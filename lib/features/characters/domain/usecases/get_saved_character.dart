import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';

class GetSavedCharactersUseCase implements UseCase<List<CharacterEntity>, void> {
  final CharacterRepository _characterRepository;
  GetSavedCharactersUseCase(this._characterRepository);

  @override
  Future<List<CharacterEntity>> call({void params}) {
    return _characterRepository.getSavedCharacters();
  }

}