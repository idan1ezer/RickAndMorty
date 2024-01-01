import 'package:floor/floor.dart';
import 'package:rick_and_morty/features/characters/data/models/character.dart';

@dao
abstract class CharacterDao {

  @insert
  Future<void> insertCharacter(CharacterModel character);

  @delete
  Future<void> deleteCharacter(CharacterModel character);

  @Query('SELECT * FROM character')
  Future<List<CharacterModel>> getCharacters();
}