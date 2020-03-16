/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-02 09:04:31
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-03 16:38:36
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './common.dart';

class IRouterTransition {
  static Route cupertino(IRouterClass route) => CupertinoPageRoute(
        builder: (BuildContext context) => route.widget,
        title: route.title,
        settings: new RouteSettings(
          name: route.path,
          isInitialRoute: false,
        ),
      );

  static Route material(IRouterClass route) => MaterialPageRoute(
        builder: (BuildContext context) => route.widget,
        settings: RouteSettings(
          name: route.path,
          isInitialRoute: false,
        ),
      );
  static Route fade(IRouterClass route) => FadeRoute(route);
}

class FadeRoute extends PageRouteBuilder {
  final IRouterClass route;
  FadeRoute(this.route)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              route.widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
