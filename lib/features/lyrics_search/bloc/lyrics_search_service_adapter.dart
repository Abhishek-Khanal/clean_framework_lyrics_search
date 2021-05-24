import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_request.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_response.dart';
import 'package:clean_framework_task/features/lyrics_search/model/lyrics_search_entity.dart';

class LyricsSearchServiceAdapter extends ServiceAdapter<LyricsSearchEntity,
    LyricsSearchServiceRequestModel, LyricsSearchServiceResponseModel, LyricsSearchService> {

  LyricsSearchServiceAdapter() : super(LyricsSearchService());

  @override
  LyricsSearchServiceRequestModel createRequest(LyricsSearchEntity entity) {
    return LyricsSearchServiceRequestModel(
        title: entity.title, artist: entity.artist);
  }


  @override
  LyricsSearchEntity createEntity(initialEntity, responseModel) {
    return initialEntity.merge(errors: <EntityFailure>[],lyrics: responseModel.lyrics) as LyricsSearchEntity;
  }
}
