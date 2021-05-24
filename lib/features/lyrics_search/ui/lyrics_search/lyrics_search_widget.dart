import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_presenter.dart';
import 'package:flutter/material.dart';

class LyricsSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LyricsSearchBloc>(
      create: (_) => LyricsSearchBloc(),
      child: LyricsSearchPresenter(),
    );
  }
}
