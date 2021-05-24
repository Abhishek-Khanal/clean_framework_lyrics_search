import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/core/enum.dart';

class LyricsSearchViewModel extends ViewModel{
  final String? artist;
  final String? title;
  final serviceStatus;
  final dataStatus;

  LyricsSearchViewModel({this.artist, this.title, this.serviceStatus = ServiceStatus.unknown, this.dataStatus = DataStatus.unknown})
      : assert(artist != null && title != null);

  @override
  List<Object?> get props => [artist, title, serviceStatus, dataStatus];
}

