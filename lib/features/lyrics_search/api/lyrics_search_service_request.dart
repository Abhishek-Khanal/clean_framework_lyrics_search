import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class LyricsSearchServiceRequestModel extends Equatable implements JsonRequestModel {
  final String? artist;
  final String? title;
  final String? lyrics;

  LyricsSearchServiceRequestModel({this.artist, this.title,this.lyrics});

  @override
  Map<String, dynamic> toJson() {
    return {'artist': artist, 'title': title,'lyrics':lyrics};
  }

  @override
  List<Object?> get props => [artist, title,lyrics];
}