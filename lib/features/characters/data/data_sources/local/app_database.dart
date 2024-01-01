import 'package:floor/floor.dart';
import 'package:rick_and_morty/features/characters/data/data_sources/local/DAO/character_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import '../../models/character.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [CharacterModel])
abstract class ApplicationDatabase extends FloorDatabase {
  CharacterDao get characterDAO;
}