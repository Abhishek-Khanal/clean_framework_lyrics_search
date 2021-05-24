import 'package:clean_framework_task/core/enum.dart';
import 'package:clean_framework/clean_framework.dart';

class LyricsSearchResultViewModel extends ViewModel {
  final String lyrics;
  final String artist;
  final String title;
  final ServiceStatus serviceStatus;
  LyricsSearchResultViewModel({
    required this.lyrics,
    required this.artist,
    required this.title,
    required this.serviceStatus,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [artist,title,lyrics,serviceStatus];
}
