/*
 * @Description: 路由
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-03 16:37:46
*/

import 'package:flutter/material.dart';
import './common.dart';
import './animation.dart';

/// [MaterialApp] 添加 `navigatorKey: InnRouter.navKey`
///
/// 设置全局路由默认过度动画 `InnRouter.transition = InnRouterTransition.cupertino;`
class InnRouter {
  /// [navigatorKey]
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  /// [设置全局路由默认过度动画]
  static Route<dynamic> Function(InnRouterClass) transition = InnRouterTransition.cupertino;

  /// [角色]
  static List<String> roles = [];

  /// [返回]
  static pop([data = ""]) => navKey.currentState.pop(data);

  /// [返回到指定路由]
  static popUntil(String path) => navKey.currentState.popUntil(ModalRoute.withName(path));

  /// [销毁当前页面并跳转新页面]
  static removeRoute(InnRouterClass route) => navKey.currentState.removeRoute(route.transition(route));

  /// [跳转新页面]
  static push(InnRouterClass route) async {
    if (!await hook(route)) return;
    return navKey.currentState.push(route.transition(route));
  }
}

Future hook(InnRouterClass route) async {
  bool permission = route.roles.any((item) => InnRouter.roles.indexOf(item) != -1);
  if (route.roles != null && route.roles.isNotEmpty && !permission) {
    if (route.notAllowFun != null)
      return route.notAllowFun();
    else
      return false;
  } else {
    return true;
  }
}
