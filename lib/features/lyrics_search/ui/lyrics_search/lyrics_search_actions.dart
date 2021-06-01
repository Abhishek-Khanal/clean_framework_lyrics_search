import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_event.dart';
import 'package:flutter/material.dart';

class LyricsSearchActions {
  LyricsSearchActions(this.bloc);

  final LyricsSearchBloc bloc;

  void onChangeArtist(String? username) {
    if(username!=null)
    bloc.artistPipe.send(username);
  }

  void onChangeTitle( String? password) {
    if(password!=null)
      bloc.titlePipe.send(password);
  }

  void onTapSearch() {
    bloc.searchPipe.send(OnSearchEvent());
  }

  void showInvalidDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Data entered is incorrect.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
