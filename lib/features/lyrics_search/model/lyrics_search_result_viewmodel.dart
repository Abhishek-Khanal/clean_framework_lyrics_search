import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:clean_framework/clean_framework.dart';

class LyricsSearchResultViewModel extends ViewModel {
  final String lyrics;
  final ServiceStatus serviceStatus;
  LyricsSearchResultViewModel({
    required this.lyrics,
    required this.serviceStatus,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [lyrics,serviceStatus];
}
