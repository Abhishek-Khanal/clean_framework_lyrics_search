import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_event.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_result_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LyricsSearchResultPresenter extends Presenter<LyricsSearchBloc,
    LyricsSearchResultViewModel, LyricsSearchResultScreen> {
  @override
  LyricsSearchResultScreen buildScreen(BuildContext context,
      LyricsSearchBloc bloc, LyricsSearchResultViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        return;
      } else {
        _showErrorDialog(context);
      }
    });
    return LyricsSearchResultScreen(
      viewModel: viewModel,
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Stream<LyricsSearchResultViewModel> getViewModelStream(
      LyricsSearchBloc bloc) {
    return bloc.lyricsSearchResultViewModelPipe.receive;
  }


  @override
  void sendViewModelRequest(bloc) {
    bloc.fetchLyricsPipe.send(OnSearchEvent());
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Search Failed'),
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
