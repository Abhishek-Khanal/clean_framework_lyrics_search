import 'package:clean_framework/clean_framework_defaults.dart';

class LyricsSearchServiceResponseModel extends JsonResponseModel {
  final String lyrics;

  LyricsSearchServiceResponseModel.fromJson(Map<String, dynamic> json)
      : lyrics = json['lyrics']??'';

  @override
  List<Object> get props => [lyrics];
}
