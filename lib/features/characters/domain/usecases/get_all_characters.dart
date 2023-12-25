import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';

class GetAllCharactersUseCase implements UseCase<DataState<List<CharacterEntity>>, void> {
  final CharacterRepository _characterRepository;
  GetAllCharactersUseCase(this._characterRepository);

  @override
  Future<DataState<List<CharacterEntity>>> call({void params}) {
    // TODO - fix the '1'
    return _characterRepository.getAllCharacters(1);
  }

}