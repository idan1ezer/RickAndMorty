import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/features/characters/data/models/character.dart';
import 'package:rick_and_morty/features/characters/domain/repositories/character_repository.dart';
import '../data_sources/remote/characters_api_service.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource _characterRemoteDataSource;
  CharacterRepositoryImpl(this._characterRemoteDataSource);

  @override
  Future<DataState<List<CharacterModel>>> getAllCharacters(int page) async {

    try {
      final httpResponse = await _characterRemoteDataSource.getAllCharacters(
        page: page.toString(),
      );

      print(httpResponse.response.statusCode);

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
  Future<DataState<CharacterModel>> getSingleCharacter(int id) {
    // TODO: implement getSingleCharacter
    throw UnimplementedError();
  }

}