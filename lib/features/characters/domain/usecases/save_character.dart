import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';

class SaveCharactersUseCase implements UseCase<void, CharacterEntity> {
  final CharacterRepository _characterRepository;
  SaveCharactersUseCase(this._characterRepository);

  @override
  Future<void> call({CharacterEntity? params}) {
    return _characterRepository.saveCharacter(params!);
  }

}