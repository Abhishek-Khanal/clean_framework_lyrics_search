import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_usecase.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_entity.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:clean_framework_task/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLyricsSearchEntity extends Mock implements LyricsSearchEntity {}

main() {
  group('LyricsSearchUseCase tests', () {
    test('testing create method', () async {
      LyricsSearchUseCase useCase = LyricsSearchUseCase((viewModel) {
        expect(viewModel, isA<LyricsSearchViewModel>());
      });
      useCase.create();
    });

    test('testing lyricsSearchEntity creation', () async {
      final entity = LyricsSearchEntity();

      ExampleLocator()
          .repository
          .create<LyricsSearchEntity>(entity, (_) {}, deleteIfExists: true);

      LyricsSearchUseCase useCase = LyricsSearchUseCase((viewModel) {
        final _scope =
        ExampleLocator().repository.containsScope<LyricsSearchEntity>();
        final entity = ExampleLocator().repository.get<LyricsSearchEntity>(_scope!);
        expect(entity, isA<LyricsSearchEntity>());
        expect(viewModel, isA<LyricsSearchViewModel>());
      });
      useCase.create();
    });
  });
}
