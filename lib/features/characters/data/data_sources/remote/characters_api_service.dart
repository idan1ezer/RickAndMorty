import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/character.dart';
import '../../../../../core/constants/constants.dart';
part 'characters_api_service.g.dart';

@RestApi(baseUrl: Urls.rickAndMortyAPIBaseURL)
abstract class CharacterRemoteDataSource {
  factory CharacterRemoteDataSource(Dio dio) = _CharacterRemoteDataSource;

  @GET('/character')
  Future<HttpResponse<List<CharacterModel>>> getAllCharacters({
    @Query("page") String? page,
  });

  @GET('/character/{id}')
  Future<HttpResponse<CharacterModel>> getSingleCharacter({
    @Path('id') int? id,
  });

}