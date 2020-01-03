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

class InnRouterTransition {
  static Route cupertino(InnRouterClass route) => CupertinoPageRoute(
        builder: (BuildContext context) => route.widget,
        title: route.title,
        settings: new RouteSettings(
          name: route.path,
          isInitialRoute: false,
        ),
      );

  static Route material(InnRouterClass route) => MaterialPageRoute(
        builder: (BuildContext context) => route.widget,
        settings: RouteSettings(
          name: route.path,
          isInitialRoute: false,
        ),
      );
}
