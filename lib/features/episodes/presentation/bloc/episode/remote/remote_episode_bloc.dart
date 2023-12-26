import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/episodes/domain/usecases/get_all_episodes.dart';
import 'package:rick_and_morty/features/episodes/presentation/bloc/episode/remote/remote_episode_event.dart';
import 'package:rick_and_morty/features/episodes/presentation/bloc/episode/remote/remote_episode_state.dart';
import '../../../../../../core/resources/data_state.dart';

class RemoteEpisodesBloc extends Bloc<RemoteEpisodeEvent, RemoteEpisodeState> {
  final GetAllEpisodesUseCase _getAllEpisodesUseCase;

  RemoteEpisodesBloc(this._getAllEpisodesUseCase) : super(const RemoteEpisodeLoading()) {
    on <GetEpisodes> (onGetEpisodes);
  }

  void onGetEpisodes(GetEpisodes event, Emitter<RemoteEpisodeState> emit) async{
    final dataState = await _getAllEpisodesUseCase.call();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemoteEpisodeDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemoteEpisodeException(dataState.exception!)
      );
    }
  }
}