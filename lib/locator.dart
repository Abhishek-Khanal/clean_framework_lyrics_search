import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework_task/core/patch_simple_rest_api.dart';


ExampleLocator locator() => ExampleLocator();

Logger logger() => ExampleLocator().logger;


class ExampleLocator implements Locator {
  ExampleLocator._();

  factory ExampleLocator() {
    Locator.init(ExampleLocator._());
    return Locator.getInstance();
  }

  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();

  @override
  Logger logger = ConsoleLogger(LogLevel.verbose);


  PatchSimpleRestApi api = PatchSimpleRestApi(
      baseUrl: 'https://api.lyrics.ovh/v1/');

  Repository repository = Repository();

  void dispose() => Locator.dispose();
}
