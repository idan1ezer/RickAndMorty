import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import '../../models/episode.dart';
part 'episodes_api_service.g.dart';

@RestApi(baseUrl: Urls.rickAndMortyAPIBaseURL)
abstract class EpisodeRemoteDataSource {
  factory EpisodeRemoteDataSource(Dio dio) = _EpisodeRemoteDataSource;

  @GET('/episode')
  Future<HttpResponse<List<EpisodeModel>>> getAllEpisodes({
    @Query("page") String? page,
  });
}