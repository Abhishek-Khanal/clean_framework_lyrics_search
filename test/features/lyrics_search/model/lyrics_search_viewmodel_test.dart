import 'package:clean_framework_task/core/enum.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LyricsSearchViewModel initialize', () async {
    final viewModel = LyricsSearchViewModel(
      artist: 'Coldplay',
      title: 'Adventure of a Lifetime',
      dataStatus: DataStatus.unknown,
    );

    expect(viewModel.artist, 'Coldplay');
    expect(viewModel.title, 'Adventure of a Lifetime');
    expect(viewModel.dataStatus, DataStatus.unknown);

    expect(viewModel.props, [
      viewModel.artist,
      viewModel.title,
      viewModel.dataStatus,
    ]);
  });
}
