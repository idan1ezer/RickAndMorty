import 'package:rick_and_morty/core/resources/data_state.dart';
import '../../domain/repositories/episode_repository.dart';
import '../data_sources/remote/episodes_api_service.dart';
import '../models/episode.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSource _episodeRemoteDataSource;
  EpisodeRepositoryImpl(this._episodeRemoteDataSource);


  @override
  Future<DataState<List<EpisodeModel>>> getAllEpisodes(int page) async {
    try {
      final httpResponse = await _episodeRemoteDataSource.getAllEpisodes(
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
  Future<DataState<EpisodeModel>> getSingleEpisode(int id) {
    // TODO: implement getSingleEpisode
    throw UnimplementedError();
  }

}