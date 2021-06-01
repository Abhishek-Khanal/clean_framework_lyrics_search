import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search_result/lyrics_search_result_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clean_framework_task/main.dart' as app;

import 'integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the search button and navigate to result screen on valid input',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await didTextAppear("Search Lyrics");
      await didTextAppear("Simple api to retrieve the lyrics of the song");
      await tapWidget("search_button_key");
      await didTextAppear("Data entered is incorrect");
      await enterText("artist_key", "Coldplay");
      await enterText("title_key", "Adventure of a Lifetime");
      await tapWidget("search_button_key");
      final Finder finder = find.byType(LyricsSearchResultScreen);
      await waitFor(finder);
      expect(finder, findsWidgets);
    });
  });
}
