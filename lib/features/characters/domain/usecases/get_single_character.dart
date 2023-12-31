import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';

class GetSingleCharacterUseCase implements UseCase<DataState<CharacterEntity>, CharacterEntity> {
  final CharacterRepository _characterRepository;
  GetSingleCharacterUseCase(this._characterRepository);

  @override
  Future<DataState<CharacterEntity>> call({CharacterEntity? params}) {
    // TODO - fix the '1'
    print("params ${params}");
    return _characterRepository.getSingleCharacter(params?.id ?? 1);
  }

}