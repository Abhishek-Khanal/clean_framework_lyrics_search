import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_event.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_result_usecase.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_usecase.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_result_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';

class LyricsSearchBloc extends Bloc {
  late LyricsSearchUseCase _lyricsSearchUseCase;
  late LyricsSearchResultUseCase _lyricsSearchResultUseCase;

  final lyricsSearchViewModelPipe =
      Pipe<LyricsSearchViewModel>(canSendDuplicateData: true);
  final lyricsSearchResultViewModelPipe =
      Pipe<LyricsSearchResultViewModel>(canSendDuplicateData: true);
  final artistPipe = Pipe<String>();
  final titlePipe = Pipe<String>();
  final searchPipe = Pipe<LyricsSearchEvent>(canSendDuplicateData: true);

  LyricsSearchBloc({LyricsSearchUseCase? lyricsSearchUseCase, LyricsSearchResultUseCase? lyricsSearchResultUseCase}) {
    _lyricsSearchUseCase = LyricsSearchUseCase((viewModel) =>
        lyricsSearchViewModelPipe.send(viewModel as LyricsSearchViewModel));
    lyricsSearchViewModelPipe.whenListenedDo(() {
      _lyricsSearchUseCase.create();
    });
    _lyricsSearchResultUseCase = LyricsSearchResultUseCase(
      (viewModel) => lyricsSearchResultViewModelPipe
          .send(viewModel as LyricsSearchResultViewModel),
    );
    lyricsSearchResultViewModelPipe.whenListenedDo(() {
      _lyricsSearchResultUseCase.create();
    });
    artistPipe.receive.listen(artistInputHandler);
    titlePipe.receive.listen(titleInputHandler);
    searchPipe.receive.listen(searchHandler);
  }

  void artistInputHandler(String artist) {
    _lyricsSearchUseCase.updateArtist(artist);
  }

  void titleInputHandler(String title) {
    _lyricsSearchUseCase.updateTitle(title);
  }

  void searchHandler(event) {
    _lyricsSearchUseCase.search();
  }

  @override
  void dispose() {
    lyricsSearchViewModelPipe.dispose();
    lyricsSearchResultViewModelPipe.dispose();
    artistPipe.dispose();
    titlePipe.dispose();
    searchPipe.dispose();
  }
}
