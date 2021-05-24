import 'package:clean_framework/clean_framework.dart';

class LyricsSearchEntity extends Entity {
  final String artist;
  final String title;
  final String lyrics;

  LyricsSearchEntity(
      {List<EntityFailure> errors = const [],
      String? artist,
      String? title,
      String? lyrics})
      : artist = artist ?? '',
        title = title ?? '',
        lyrics = lyrics ?? '',
        super(errors: errors);

  @override
  List<Object> get props => [artist, title, errors];

  @override
  merge({errors, String? artist, String? title, String? lyrics}) {
    return LyricsSearchEntity(
      errors: errors ?? this.errors,
      artist: artist ?? this.artist,
      title: title ?? this.title,
      lyrics: lyrics ?? this.lyrics,
    );
  }
}
