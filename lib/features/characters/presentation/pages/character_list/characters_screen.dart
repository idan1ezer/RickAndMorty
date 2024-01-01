import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/remote/remote_character_state.dart';

import '../../widgets/character_tile.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super (key: key);

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
        'Characters',
        style: TextStyle(
            color: Colors.black
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedCharactersViewTapped(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(CupertinoIcons.heart_fill, color: Colors.red),
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteCharacterBloc, RemoteCharacterState> (
      builder: (_,state) {
        if (state is RemoteCharacterLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteCharacterException) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteCharacterDone) {
          return ListView.builder(
            itemBuilder: (context,index){
              return CharacterWidget(
                character: state.characters![index] ,
                onCharacterPressed: (character) => _onCharacterPressed(context,character),
              );
            },
            itemCount: state.characters!.length,
          );
        }
        return const SizedBox();
      },
    );
  }

  void _onCharacterPressed(BuildContext context, CharacterEntity character) {
    Navigator.pushNamed(context, '/CharacterDetails', arguments: character);
  }

  void _onShowSavedCharactersViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedCharacters');
  }
}