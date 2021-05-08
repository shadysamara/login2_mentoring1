import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey;
  NavigationService._() {
    navigatorKey = GlobalKey<NavigatorState>();
  }
  static NavigationService navigationService = NavigationService._();

  navigateToWidget(Widget widget) {
    navigatorKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  navigateAndReplaceWidget(Widget widget) {
    navigatorKey.currentState
        .pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  naviagateToRoute(String route) {
    navigatorKey.currentState.pushNamed(route);
  }
}
