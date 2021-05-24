import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LyricsSearchServiceRequestModel initialize', () async {
    final viewModel = LyricsSearchServiceRequestModel(
      artist: 'Coldplay',
      title: 'Adventure of a Lifetime',
    );

    expect(viewModel.artist, 'Coldplay');
    expect(viewModel.title, 'Adventure of a Lifetime');
  });

  test('LyricsSearchServiceRequestModel toJson', () async {
    final viewModel = LyricsSearchServiceRequestModel(
      artist: 'Coldplay',
      title: 'Adventure of a Lifetime',
    );

    expect(viewModel.toJson(),
        {"artist": 'Coldplay', "title": 'Adventure of a Lifetime'});
  });
}