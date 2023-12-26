import '../../../../core/resources/data_state.dart';
import '../entities/episode.dart';

abstract class EpisodeRepository {
  Future<DataState<List<EpisodeEntity>>> getAllEpisodes(int page);
  Future<DataState<EpisodeEntity>> getSingleEpisode(int id);
}