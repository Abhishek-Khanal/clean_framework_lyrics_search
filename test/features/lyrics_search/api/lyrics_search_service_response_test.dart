import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LyricsSearchServiceResponseModel initialize', () async {
    final viewModel = LyricsSearchServiceResponseModel.fromJson(
        {'lyrics': 'No lyrics found'});

    expect(viewModel.lyrics, 'No lyrics found');

    expect(viewModel.props, [
      viewModel.lyrics,
    ]);
  });
}
