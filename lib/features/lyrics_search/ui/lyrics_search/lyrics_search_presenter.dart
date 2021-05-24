import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_event.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
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
        _showInvalidDataDialog(context);
        return;
      } else {
        return;
      }
    });
    return LyricsSearchScreen(
      viewModel: viewModel,
      onChangeArtist: (value) {
        _onChangeArtist(bloc, value);
      },
      onChangeTitle: (value) {
        _onChangeTitle(bloc, value);
      },
      onTapSearch: () => _navigateToLyricsSearchResultScreen(context, bloc),
    );
  }

  void _onChangeArtist(LyricsSearchBloc bloc, String username) {
    bloc.artistPipe.send(username);
  }

  void _onChangeTitle(LyricsSearchBloc bloc, String password) {
    bloc.titlePipe.send(password);
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

  void _navigateToLyricsSearchResultScreen(
      BuildContext context, LyricsSearchBloc bloc) {
    bloc.searchPipe.send(OnSearchEvent());
  }

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Data entered is incorrect.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              CFRouterScope.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
