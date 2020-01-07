/*
 * @Description: 路由
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-06 15:50:06
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

  static Route<dynamic> Function(RouteSettings) onGenerateRoute = (RouteSettings settings) {
    InnRouterClass data = settings.arguments;
    return data.transition(data);
  };

  /// [返回]
  static pop([data = ""]) => navKey.currentState.pop(data);

  /// [返回到指定路由]
  static popUntil(InnRouterClass route) => navKey.currentState.popUntil(ModalRoute.withName(route.path));

  /// [跳转新页面]
  static push(InnRouterClass route) async {
    if (!await hook(route)) return;
    return navKey.currentState.pushNamed(route.path, arguments: route);
  }

  /// [销毁当前页面并跳转新页面]
  static removeRoute(InnRouterClass route) => navKey.currentState.removeRoute(route.transition(route));

  /// [把当前页面替换成新页面]
  static pushReplacementNamed(InnRouterClass route) => navKey.currentState.pushReplacementNamed(route.path, arguments: route);

  /// [返回并跳转新页面]
  static popAndPushNamed(InnRouterClass route) => navKey.currentState.popAndPushNamed(route.path, arguments: route);

  /// [删除之前页面并跳转新页面]
  static pushNamedAndRemoveUntil(InnRouterClass route, [InnRouterClass remove]) => navKey.currentState.pushNamedAndRemoveUntil(
        route.path,
        remove == null ? (route) => route == null : ModalRoute.withName(remove.path),
        arguments: route,
      );
}

Future hook(InnRouterClass route) async {
  bool permission = route.roles.any((item) => InnRouter.roles.indexOf(item) != -1);
  if (route.roles != null && route.roles.isNotEmpty && !permission) {
    debugPrint("权限不足");
    if (route.notAllowFun != null)
      return route.notAllowFun();
    else
      return false;
  } else {
    return true;
  }
}
