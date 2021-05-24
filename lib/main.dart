import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_task/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    CFRouterScope(
      routeGenerator: LyricsFinderRouter.generate,
      initialRoute: LyricsFinderRouter.initialRoute,
      builder: (context) => MaterialApp.router(
        routeInformationParser: CFRouteInformationParser(),
        routerDelegate: CFRouterDelegate(context),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
