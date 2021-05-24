import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LyricsSearchService service;

  setUp(() {
    service = LyricsSearchService();
  });

  test('LyricsSearchService parseResponse', () async {
    final json = {
      "lyrics": 'No lyrics found',
    };

    LyricsSearchServiceResponseModel response = service.parseResponse(json);

    expect(response, LyricsSearchServiceResponseModel.fromJson(json));
  });

  test('should perform a GET request', () async {
    final eitherResponce = await service.request();

    expect(eitherResponce.isRight, isTrue);
  });
}
