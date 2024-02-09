import 'package:app_state/app_state.dart';
import 'package:flutter/material.dart';

import '9_state/pages/home/page.dart';
import '9_state/router/page_factory.dart';
import '9_state/router/route_information_parser.dart';

final pageStack = PageStack(
  bottomPage: HomePage(),
  createPage: PageFactory.createPage,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routerDelegate = PageStackRouterDelegate(pageStack);
  final _routeInformationParser = MyRouteInformationParser();
  final _backButtonDispatcher = PageStackBackButtonDispatcher(pageStack);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      backButtonDispatcher: _backButtonDispatcher,
    );
  }
}
