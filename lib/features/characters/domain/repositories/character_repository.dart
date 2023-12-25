import 'package:rick_and_morty/features/characters/domain/entities/character.dart';

import '../../../../core/resources/data_state.dart';

abstract class CharacterRepository {
  Future<DataState<List<CharacterEntity>>> getAllCharacters(int page);
  Future<DataState<CharacterEntity>> getSingleCharacter(int id);
}