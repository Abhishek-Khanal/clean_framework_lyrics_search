import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_entity.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_result_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import '../../../locator.dart';
import 'lyrics_search_service_adapter.dart';

class LyricsSearchResultUseCase extends UseCase {
  Function(ViewModel) _lyricsSearchResultViewModelCallBack;
  RepositoryScope? _scope;

  LyricsSearchResultUseCase(
      Function(ViewModel) _lyricsSearchResultViewModelCallBack)
      : _lyricsSearchResultViewModelCallBack =
            _lyricsSearchResultViewModelCallBack;

  void create() {
    _scope = ExampleLocator().repository.containsScope<LyricsSearchEntity>();
    if (_scope == null) {
      final newLyricsSearchEntity = LyricsSearchEntity();
      _scope = ExampleLocator().repository.create<LyricsSearchEntity>(
          newLyricsSearchEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
  }

  fetchLyrics() async {
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope!, LyricsSearchServiceAdapter());
    sendViewModelToSubscribers();
  }

  void sendViewModelToSubscribers() {
    LyricsSearchEntity lyricsSearchEntity =
        ExampleLocator().repository.get(_scope!);
    _notifySubscribers(lyricsSearchEntity);
  }

  void _notifySubscribers(entity) {
    _lyricsSearchResultViewModelCallBack(
        buildViewModelForServiceUpdate(entity));
  }

  LyricsSearchResultViewModel buildViewModelForServiceUpdate(
      LyricsSearchEntity entity) {
    if (entity.hasErrors()) {
      return LyricsSearchResultViewModel(
          lyrics: "", serviceStatus: ServiceStatus.fail);
    } else {
      return LyricsSearchResultViewModel(
        lyrics: entity.lyrics,
        serviceStatus: ServiceStatus.success,
      );
    }
  }
}
