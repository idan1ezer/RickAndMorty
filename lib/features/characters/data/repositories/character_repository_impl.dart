import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/features/characters/data/models/character.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import '../data_sources/local/app_database.dart';
import '../data_sources/remote/characters_api_service.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource _characterRemoteDataSource;
  final ApplicationDatabase _appDatabase;
  CharacterRepositoryImpl(this._characterRemoteDataSource, this._appDatabase);

  @override
  Future<DataState<List<CharacterModel>>> getAllCharacters(int page) async {

    try {
      final httpResponse = await _characterRemoteDataSource.getAllCharacters(
        page: page.toString(),
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CharacterModel>> getSingleCharacter(int id) async{
    try {
      final httpResponse = await _characterRemoteDataSource.getSingleCharacter(
        id: id,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      else {
        return DataFailed(
            DioException(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioExceptionType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<List<CharacterModel>> getSavedCharacters() {
    return _appDatabase.characterDAO.getCharacters();
  }

  @override
  Future<void> removeCharacter(CharacterEntity character) {
    return _appDatabase.characterDAO.deleteCharacter(CharacterModel.fromEntity(character));
  }

  @override
  Future<void> saveCharacter(CharacterEntity character) {
    return _appDatabase.characterDAO.insertCharacter(CharacterModel.fromEntity(character));
  }

}