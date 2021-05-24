import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LyricsSearchEntity initialize with null values', () async {
    final entity = LyricsSearchEntity();
    expect(entity.artist, '');
    expect(entity.title, '');
    expect(entity.lyrics, '');
    expect(entity.errors, []);
    expect(entity.props, [
      entity.artist,
      entity.title,
      entity.lyrics,
    ]);
  });

  test('LyricsSearchEntity initialize with real values', () async {
    final entity = LyricsSearchEntity(
      artist: 'Coldplay',
      title: 'Adventure of a Lifetime',
      lyrics: 'No lyrics found',
    );
    expect(entity.artist, 'Coldplay');
    expect(entity.title, 'Adventure of a Lifetime');
    expect(entity.lyrics, 'No lyrics found');
    expect(entity.props, [
      entity.artist,
      entity.title,
      entity.lyrics,
    ]);
  });

  test('LyricsSearchEntity merge', () async {
    final entity = LyricsSearchEntity(
      artist: 'Coldplay',
      title: 'Adventure of a Lifetime',
      lyrics: 'No lyrics found',
    );

    final entity2 = entity.merge(
      artist: 'Bruno Mars',
      title: 'Uptown Funk',
      lyrics: 'Lyrics found',
    ) as LyricsSearchEntity;

    expect(entity2.artist, "Bruno Mars");
    expect(entity2.title, "Uptown Funk");
    expect(entity2.lyrics, "Lyrics found");

    final entity3 = entity2.merge() as LyricsSearchEntity;

    expect(entity2.artist, entity3.artist);
    expect(entity2.title, entity3.title);
    expect(entity2.lyrics, entity3.lyrics);
  });
}
