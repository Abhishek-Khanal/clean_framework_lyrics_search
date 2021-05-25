import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_response.dart';
import 'package:clean_framework_task/features/lyrics_search/bloc/lyrics_search_service_adapter.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('lyrics search service adapter test', () {
    final tInitEntity = LyricsSearchEntity(
      lyrics: 'How is the lyrics');

    final tEntity = LyricsSearchEntity(
      artist: "Coldplay",
      title: "Adventure of a Lifetime",
    );
    final tRequestModel = LyricsSearchEntity(
      artist: "Coldplay",
      title: "Adventure of a Lifetime",
    );


    final tJsonResponse = {
      "lyrics": "How is the lyrics",
    };

    test('should received a json response and return lyrics', () async {
      final entity = LyricsSearchServiceAdapter().createEntity(
          LyricsSearchEntity(),
          LyricsSearchServiceResponseModel.fromJson(tJsonResponse));
      expect(entity.lyrics, tInitEntity.lyrics);
    });
    test(
        'should received a LyricsSearchEntity and return LyricsSearchServiceRequestModel',
        () async {
      final requestModel = LyricsSearchServiceAdapter().createRequest(tEntity);
      expect(requestModel.artist, tRequestModel.artist);
      expect(requestModel.title, tRequestModel.title);
    });
  });
}
