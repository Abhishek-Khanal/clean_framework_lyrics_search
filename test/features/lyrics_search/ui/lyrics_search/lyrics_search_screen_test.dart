import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/core/enum.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_viewmodel.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_actions.dart';
import 'package:clean_framework_task/features/lyrics_search/ui/lyrics_search/lyrics_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

Element get navElement => find.byType(Navigator).evaluate().first;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockLyricsSearchActions extends Mock implements LyricsSearchActions {}

void main() {
  late MaterialApp testWidgetSucceed;
  late MaterialApp testWidgetFailed;
  late LyricsSearchViewModel succeedLyricsSearchViewModel;
  late LyricsSearchViewModel failedLyricsSearchViewModel;
  late MockLyricsSearchActions mockLyricsSearchActions;

  setUpAll(() {
    mockLyricsSearchActions = MockLyricsSearchActions();
    succeedLyricsSearchViewModel = LyricsSearchViewModel(
        artist: "ColdPlay",
        title: "Adventure of a Lifetime",
        dataStatus: DataStatus.valid);
    failedLyricsSearchViewModel = LyricsSearchViewModel(
        artist: "", title: "", dataStatus: DataStatus.invalid);

    testWidgetSucceed = MaterialApp(
      home: MaterialApp(
        home: LyricsSearchScreen(
          actions: mockLyricsSearchActions,
          viewModel: succeedLyricsSearchViewModel,
        ),
      ),
    );

    testWidgetFailed = MaterialApp(
      home: MaterialApp(
        home: LyricsSearchScreen(
          actions: mockLyricsSearchActions,
          viewModel: failedLyricsSearchViewModel,
        ),
      ),
    );
  });

  void verifyParentActions() {
    verify(mockLyricsSearchActions.onTapSearch()).called(1);
  }

  group("LyricsSearchScreen test", () {
    testWidgets('LyricsSearchScreen test all elements are present',
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      final titleFinder = find.text("Search Lyrics");
      final descriptionFinder =
          find.text("Simple api to retrieve the lyrics of the song");
      final textField = find.byType(TextField);
      expect(titleFinder, findsOneWidget);
      expect(descriptionFinder, findsOneWidget);
      expect(textField, findsNWidgets(2));
      final button = find.text("Search");
      expect(button, findsOneWidget);
    });

    testWidgets("when user enter value It should be findable",
        (WidgetTester tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      final artistField = find.byKey(Key("artist_key"));
      final titleField = find.byKey(Key("title_key"));
      await tester.enterText(artistField, "Coldplay");
      expect(find.text("Coldplay"), findsOneWidget);
      await tester.enterText(titleField, "Adventure of a Lifetime");
      expect(find.text("Adventure of a Lifetime"), findsOneWidget);
    });

    testWidgets(
        'should call lyrics search presenter actions on tap of search button or text field input',
        (tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      final button = find.text("Search");
      await tester.tap(button);
      verifyParentActions();
      final artistField = find.byKey(Key("artist_key"));
      final titleField = find.byKey(Key("title_key"));
      await tester.enterText(artistField, "Coldplay");
      verify(mockLyricsSearchActions.onChangeArtist(any)).called(1);
      expect(find.text("Coldplay"), findsOneWidget);
      await tester.enterText(titleField, "Adventure of a Lifetime");
      verify(mockLyricsSearchActions.onChangeTitle(any)).called(1);
    });

    testWidgets('should not navigate to another screen on call of tap callback on empty data',
        (WidgetTester tester) async {
      Widget buildWidget({
        String initialRoute = '/',
        CFRouteGenerator? generator,
        void Function(CFRoutePage)? onUpdate,
      }) {
        return CFRouterScope(
          initialRoute: initialRoute,
          routeGenerator: generator!,
          builder: (context) {
            return MaterialApp.router(
              routerDelegate: CFRouterDelegate(context, onUpdate: onUpdate),
              routeInformationParser: CFRouteInformationParser(),
            );
          },
        );
      }

      await tester.pumpWidget(buildWidget(generator: (name) {
        switch (name) {
          case '/':
            return LyricsSearchScreen(
              actions: mockLyricsSearchActions,
              viewModel: succeedLyricsSearchViewModel,
            );
          default:
            return Container();
        }

      }));
      expect(navElement.router.previousPage?.name, isNull);
      expect(navElement.router.currentPage.name, '/');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(navElement.router.currentPage.name, '/');
    });
  });
}
