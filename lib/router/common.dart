/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2019-12-24 09:36:45
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-14 11:20:01
*/
import 'package:flutter/material.dart';
import './index.dart';

class IRouterClass {
  /// [路径]
  final String path;

  /// [页面]
  final Widget widget;

  /// [标题]
  final String title;

  /// [角色权限]
  final List<String> roles;

  /// [是否有权限]
  final bool permission;

  /// [路由过度动画]
  final Route<dynamic> Function(IRouterClass) transition;

  /// [权限不足回调]
  final bool Function() notAllowFun;

  /// [图标]
  final IconData icon;

  /// [颜色]
  final Color color;

  IRouterClass({
    @required this.widget,
    @required this.path,
    this.roles = const [],
    this.title = '',
    transition,
    this.notAllowFun,
    this.icon,
    this.color,
    bool permission,
  })  : transition = transition ?? IRouter.transition,
        permission = permission ?? hook(roles, notAllowFun);
}
