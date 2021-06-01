import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/core/enum.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_actions.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_screen.dart';
import 'package:clean_framework_task/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LyricsSearchPresenter extends Presenter<LyricsSearchBloc,
    LyricsSearchViewModel, LyricsSearchScreen> {
  @override
  LyricsSearchScreen buildScreen(BuildContext context, LyricsSearchBloc bloc,
      LyricsSearchViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.dataStatus == DataStatus.valid) {
        CFRouterScope.of(context).push(LyricsFinderRouter.lyricsSearchResult);
        return;
      } else if (viewModel.dataStatus == DataStatus.invalid) {
        LyricsSearchActions(bloc).showInvalidDataDialog(context);
        return;
      } else {
        return;
      }
    });
    return LyricsSearchScreen(
        viewModel: viewModel, actions: LyricsSearchActions(bloc));
  }

  @override
  Stream<LyricsSearchViewModel> getViewModelStream(LyricsSearchBloc bloc) {
    return bloc.lyricsSearchViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
