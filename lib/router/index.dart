/*
 * @Description: 路由
 * @Version: 2.0
 * @Autor: lqrui.cn
 * @Date: 2019-10-28 08:51:12
 * @LastEditors: hwd
 * @LastEditTime: 2020-01-16 15:18:33
*/

import 'package:flutter/material.dart';
import './common.dart';
import './animation.dart';

/// [MaterialApp] 添加 `navigatorKey: IRouter.navKey`
///
/// 设置全局路由默认过度动画 `IRouter.transition = IRouterTransition.cupertino;`
class IRouter {
  /// [navigatorKey]
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  /// [设置全局路由默认过度动画]
  static Route<dynamic> Function(IRouterClass) transition = IRouterTransition.cupertino;

  /// [角色]
  static List<String> roles = [];

  static Route<dynamic> Function(RouteSettings) onGenerateRoute = (RouteSettings settings) {
    IRouterClass data = settings.arguments;
    return data.transition(data);
  };

  /// [返回]
  static pop([data = ""]) => navKey.currentState.pop(data);

  /// [返回到指定路由]
  static popUntil(IRouterClass route) => navKey.currentState.popUntil(ModalRoute.withName(route.path));

  /// [跳转新页面]
  static push(IRouterClass route) async {
    if (!hook(route.roles, route.notAllowFun)) return;
    return navKey.currentState.pushNamed(route.path, arguments: route);
  }

  /// [销毁当前页面并跳转新页面]
  static removeRoute(IRouterClass route) => navKey.currentState.removeRoute(route.transition(route));

  /// [把当前页面替换成新页面]
  static pushReplacementNamed(IRouterClass route) => navKey.currentState.pushReplacementNamed(route.path, arguments: route);

  /// [返回并跳转新页面]
  static popAndPushNamed(IRouterClass route) => navKey.currentState.popAndPushNamed(route.path, arguments: route);

  /// [删除之前页面并跳转新页面]
  static pushNamedAndRemoveUntil(IRouterClass route, [IRouterClass remove]) => navKey.currentState.pushNamedAndRemoveUntil(
        route.path,
        remove == null ? ModalRoute.withName("/") : ModalRoute.withName(remove.path),
        arguments: route,
      );
}

bool hook(List<String> roles, bool Function() notAllowFun) {
  bool permission = roles.any((item) => IRouter.roles.indexOf(item) != -1);
  if (roles != null && roles.isNotEmpty && !permission) {
    debugPrint("权限不足");
    if (notAllowFun != null)
      return notAllowFun();
    else
      return false;
  } else {
    return true;
  }
}
