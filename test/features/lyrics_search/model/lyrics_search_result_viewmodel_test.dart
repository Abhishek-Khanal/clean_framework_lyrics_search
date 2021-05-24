import 'package:clean_framework_task/core/enum.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_result_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LyricsSearchResultViewModel initialize', () async {
    final viewModel = LyricsSearchResultViewModel(
      artist: 'Coldplay',
      title: 'Adventure of a Lifetime',
      lyrics: 'Lyrics not found',
      serviceStatus: ServiceStatus.unknown,
    );

    expect(viewModel.artist, 'Coldplay');
    expect(viewModel.title, 'Adventure of a Lifetime');
    expect(viewModel.serviceStatus, ServiceStatus.unknown);

    expect(viewModel.props, [
      viewModel.artist,
      viewModel.title,
      viewModel.lyrics,
      viewModel.serviceStatus,
    ]);
  });
}
