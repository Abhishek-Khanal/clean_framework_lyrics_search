import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_bloc.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_result_usecase.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLyricsSearchUseCase extends Mock implements LyricsSearchUseCase {}

class MockLyricsSearchResultUseCase extends Mock
    implements LyricsSearchResultUseCase {}

main() {
  late LyricsSearchBloc bloc;
  late MockLyricsSearchUseCase mockLyricsSearchUseCase;
  late MockLyricsSearchResultUseCase mockLyricsSearchResultUseCase;
  setUp(() {
    mockLyricsSearchUseCase = MockLyricsSearchUseCase();
    mockLyricsSearchResultUseCase = MockLyricsSearchResultUseCase();
    bloc = LyricsSearchBloc(
        lyricsSearchUseCase: mockLyricsSearchUseCase,
        lyricsSearchResultUseCase: mockLyricsSearchResultUseCase);
  });

  group('', () {
    test('LyricsSearchBloc initialize', () async {
      expect(bloc.lyricsSearchViewModelPipe, isNotNull);
      expect(bloc.searchPipe, isNotNull);
      expect(bloc.artistPipe, isNotNull);
      expect(bloc.titlePipe, isNotNull);
      expect(bloc.lyricsSearchResultViewModelPipe, isNotNull);
    });


    test('lyricsSearchResultViewModelPipe streams out LyricsSearchResultViewModel to listeners.',
        ()async {
      bloc.lyricsSearchResultViewModelPipe.receive.listen((model) {
        verify(mockLyricsSearchResultUseCase.create()).called(1);
      });
    });


    test('LyricsSearchBloc dispose', () async {
      bloc.dispose();
      expect(bloc.artistPipe.receive, emitsDone);
      expect(bloc.titlePipe.receive, emitsDone);
      expect(bloc.searchPipe.receive, emitsDone);
      expect(bloc.lyricsSearchResultViewModelPipe.receive, emitsDone);
      expect(bloc.lyricsSearchViewModelPipe.receive, emitsDone);
    });
  });
}
