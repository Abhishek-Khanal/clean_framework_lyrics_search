import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework_task/core/enum.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_entity.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import '../../../locator.dart';


class LyricsSearchUseCase extends UseCase {
  Function(ViewModel) _lyricsSearchViewModelCallBack;
  RepositoryScope? _scope;

  LyricsSearchUseCase(Function(ViewModel) _lyricsSearchViewModelCallBack)
      : _lyricsSearchViewModelCallBack = _lyricsSearchViewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<LyricsSearchEntity>();
    if (_scope == null) {
      final newLyricsSearchEntity = LyricsSearchEntity();
      _scope = ExampleLocator().repository.create<LyricsSearchEntity>(
          newLyricsSearchEntity, _notifySubscribers);
    } else {
      _scope!.subscription = _notifySubscribers;
    }
    final entity = ExampleLocator().repository.get<LyricsSearchEntity>(_scope!);
    _lyricsSearchViewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void search() async {
    final entity = ExampleLocator().repository.get<LyricsSearchEntity>(_scope!);
    if (entity.artist == '' || entity.title == '') {
      _lyricsSearchViewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
    } else {
      _lyricsSearchViewModelCallBack(buildViewModelForLocalUpdateWithSuccess(entity));
    }
  }


  void updateArtist(String artist) async {
    final entity = ExampleLocator().repository.get<LyricsSearchEntity>(_scope!);
    final updatedEntity = entity.merge(artist: artist);
    ExampleLocator().repository.update<LyricsSearchEntity>(
        _scope!, updatedEntity as LyricsSearchEntity);
    _lyricsSearchViewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateTitle(String title) async {
    final entity = ExampleLocator().repository.get<LyricsSearchEntity>(_scope!);

    final updatedEntity = entity.merge(title: title);
    ExampleLocator().repository.update<LyricsSearchEntity>(
        _scope!, updatedEntity as LyricsSearchEntity);
    _lyricsSearchViewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void _notifySubscribers(entity) {
    _lyricsSearchViewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  LyricsSearchViewModel buildViewModelForServiceUpdate(
      LyricsSearchEntity entity) {
    if (entity.hasErrors()) {
      return LyricsSearchViewModel(
          artist: entity.artist,
          title: entity.title,
          serviceStatus: ServiceStatus.fail);
    } else {
      return LyricsSearchViewModel(
          artist: entity.artist,
          title: entity.title,
          serviceStatus: ServiceStatus.success);
    }
  }

  LyricsSearchViewModel buildViewModelForLocalUpdate(
      LyricsSearchEntity entity) {
    return LyricsSearchViewModel(
      artist: entity.artist,
      title: entity.title,
    );
  }
  LyricsSearchViewModel buildViewModelForLocalUpdateWithSuccess(
      LyricsSearchEntity entity) {
    return LyricsSearchViewModel(
      artist: entity.artist,
      title: entity.title,
      dataStatus: DataStatus.valid
    );
  }

  LyricsSearchViewModel buildViewModelForLocalUpdateWithError(
      LyricsSearchEntity entity) {
    return LyricsSearchViewModel(
        artist: entity.artist,
        title: entity.title,
        dataStatus: DataStatus.invalid);
  }
}
