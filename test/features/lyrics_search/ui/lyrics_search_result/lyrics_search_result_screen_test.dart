import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LyricsSearchScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LyricsSearchResultScreen()));
    final titleFinder = find.byKey(Key('titleText'));
    final artistFinder = find.byKey(Key('artistText'));
    final lyricsFinder = find.text("Lyrics:");
    final lyricsResult = find.byKey(Key('lyricsResultText'));
    expect(titleFinder, findsOneWidget);
    expect(artistFinder, findsOneWidget);
    expect(lyricsFinder, findsOneWidget);
    expect(lyricsResult, findsOneWidget);
  });
}
