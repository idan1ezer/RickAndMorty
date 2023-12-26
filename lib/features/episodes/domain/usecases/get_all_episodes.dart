import 'package:rick_and_morty/core/resources/data_state.dart';
import 'package:rick_and_morty/core/usecase/usecase.dart';
import 'package:rick_and_morty/features/episodes/domain/entities/episode.dart';
import 'package:rick_and_morty/features/episodes/domain/repositories/episode_repository.dart';

class GetAllEpisodesUseCase implements UseCase<DataState<List<EpisodeEntity>>, void> {
  final EpisodeRepository _episodeRepository;
  GetAllEpisodesUseCase(this._episodeRepository);

  @override
  Future<DataState<List<EpisodeEntity>>> call({void params}) {
    // TODO - fix the '1'
    return _episodeRepository.getAllEpisodes(1);
  }

}