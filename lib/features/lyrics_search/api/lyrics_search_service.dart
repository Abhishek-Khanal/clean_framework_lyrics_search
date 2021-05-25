import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_request.dart';
import 'package:clean_framework_task/features/lyrics_search/api/lyrics_search_service_response.dart';

import '../../../locator.dart';

class LyricsSearchService extends EitherService<LyricsSearchServiceRequestModel,
    LyricsSearchServiceResponseModel> {
  LyricsSearchService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          //path: '{artist}/{title}',Keep getting null don't know why
          path: 'Coldplay/Adventure of a Lifetime',
        );

  @override
  LyricsSearchServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return LyricsSearchServiceResponseModel.fromJson(jsonResponse);
  }

  @override
  ServiceFailure onError(
      RestResponseType responseType, Map<String, dynamic> jsonResponse) {
    return GeneralServiceFailure();
  }
}
