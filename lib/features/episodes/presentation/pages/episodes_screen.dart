import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/episode/remote/remote_episode_bloc.dart';
import '../bloc/episode/remote/remote_episode_state.dart';
import '../widgets/episode_tile.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Episodes',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          // onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.science, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteEpisodesBloc, RemoteEpisodeState> (
      builder: (_,state) {
        if (state is RemoteEpisodeLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteEpisodeException) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteEpisodeDone) {
          return ListView.builder(
            itemBuilder: (context,index){
              return EpisodeWidget(
                episode: state.episodes![index] ,
                // onCharacterPressed: (character) => _onCharacterPressed(context,character),
              );
            },
            itemCount: state.episodes!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

}