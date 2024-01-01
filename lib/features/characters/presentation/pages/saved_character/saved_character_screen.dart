import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty/features/characters/domain/entities/character.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/local/local_character_bloc.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/local/local_character_event.dart';
import 'package:rick_and_morty/features/characters/presentation/bloc/character/local/local_character_state.dart';
import 'package:rick_and_morty/features/characters/presentation/widgets/character_tile.dart';
import '../../../../../injection_container.dart';

class SavedCharacterScreen extends HookWidget {
  const SavedCharacterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalCharacterBloc>()..add(const GetSavedCharacters()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }


  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.chevron_left, color: Colors.black),
        ),
      ),
      title: const Text('Saved Characters', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalCharacterBloc, LocalCharacterState>(
      builder: (context, state) {
        if (state is LocalCharacterLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalCharacterDone) {
          return _buildCharactersList(state.characters!);
        }
        return Container();
      },
    );
  }

  Widget _buildCharactersList(List<CharacterEntity> characters) {
    if (characters.isEmpty) {
      return const Center(
          child: Text(
            'NO SAVED CHARACTERS',
            style: TextStyle(color: Colors.black),
          ));
    }

    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterWidget(
          character: characters[index],
          isRemovable: true,
          onRemove: (character) => _onRemoveCharacter(context, character),
          onCharacterPressed: (character) => _onCharacterPressed(context, character),
        );
      },
    );
  }



  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveCharacter(BuildContext context, CharacterEntity character) {
    BlocProvider.of<LocalCharacterBloc>(context).add(RemoveCharacter(character));
  }

  void _onCharacterPressed(BuildContext context, CharacterEntity character) {
    Navigator.pushNamed(context, '/CharacterDetails', arguments: character);
  }

}