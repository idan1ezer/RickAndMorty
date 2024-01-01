import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';

class RemoveCharactersUseCase implements UseCase<void, CharacterEntity> {
  final CharacterRepository _characterRepository;
  RemoveCharactersUseCase(this._characterRepository);

  @override
  Future<void> call({CharacterEntity? params}) {
    return _characterRepository.removeCharacter(params!);
  }

}