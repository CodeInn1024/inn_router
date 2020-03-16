<!--
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 16:18:32
 * @LastEditors  : lqrui.cn
 * @LastEditTime : 2020-01-05 09:13:59
 -->
 
# inn_router

[![pub package](https://img.shields.io/pub/v/inn_router.svg)](https://pub.dartlang.org/packages/inn_router)
[![GitHub stars](https://img.shields.io/github/stars/CodeInn1024/inn_router)](https://github.com/CodeInn1024/inn_router/stargazers) 
[![GitHub forks](https://img.shields.io/github/forks/CodeInn1024/inn_router)](https://github.com/CodeInn1024/inn_router/network) 
[![GitHub issues](https://img.shields.io/github/issues/CodeInn1024/inn_router)](https://github.com/CodeInn1024/inn_router/issues)


## 使用方法:

*  添加依赖

```yaml
dependencies:
  inn_router: any
```

* 安装

```yaml
flutter pub get
```

* 导入和配置

```dart
import 'package:inn_router/inn_router.dart';

Widget build(BuildContext context) {
	return MaterialApp(
		title: '',
		navigatorKey: IRouter.navKey, //添加
	);
}
```

* 配置路由表

在lib中创建router文件夹，如果项目比较大，可以按模块来创建，一个模块一个文件。

路径命名推荐：`/模块名/功能名`

```dart
import './page1.dart';
import 'package:inn_router/inn_router.dart';

class Routes {
  static String path = "/router";
  static IRouterClass get page1 => IRouterClass(widget: Page1(), path: "$path/page1");
  static IRouterClass page2(String parameter) => IRouterClass(widget: Page1(parameter:parameter), path: "$path/page2");
}
```

* 使用

```dart
IRouter.push(Routes.page1);
IRouter.push(Routes.page2("我是参数"));
```

## 功能

### 路由属性 IRouterClass

| 属性        | 类型                                    | 默认值 | 描述                                    |
| :---------- | :-------------------------------------- | :----- | :-------------------------------------- |
| path        | String                                  | 必须   | 跳转路径                                |
| widget      | Widget                                  | 必须   | 页面                                    |
| title       | String                                  | 可选   | 标题                                    |
| roles       | List<String>                            | 可选   | 角色权限                                |
| transition  | Route<dynamic> Function(IRouterClass) | 可选   | 单个路由过度动画                        |
| notAllowFun | List<String>                            | 可选   | 权限不足回调，返回flase不跳转，true跳转 |
| icon        | int                                     | 可选   | 图标                                    |
| color       | int                                     | 可选   | 颜色                                    |

### 设置权限表
```
IRouter.roles = ["admin"];
```

### 设置全局路由默认过度动画
```dart
IRouter.transition = IRouterTransition.cupertino;
```

### 自定义路由过渡动画
```dart
class SlideRight extends PageRouteBuilder {
  final IRouterClass route;
  SlideRight({this.route})
      : super(
          transitionDuration: Duration(milliseconds: 300),
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
              SlideTransition(
            position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(animation),
            child: child,
          ),
        );
}

// 全局使用
IRouter.transition = (IRouterClass route) => SlideRight(route: route);

// 单个路由使用
IRouterClass(widget: Page1(), path: "$path/material", title: "material", transition: (IRouterClass route) => SlideRight(route: route));
```

### push 跳转新页面
```dart
IRouter.push(Routes.page1);
```

### pop 返回
```dart
IRouter.pop();
```

### popUntil 返回到指定路由
```dart
IRouter.popUntil(Routes.page1);
```

### removeRoute 销毁当前页面并跳转新页面
```dart
IRouter.removeRoute(Routes.page1);
```

### pushReplacementNamed 把当前页面替换成新页面
```dart
IRouter.pushReplacementNamed(Routes.page1);
```

### popAndPushNamed 返回并跳转新页面
```dart
IRouter.popAndPushNamed(Routes.page1);
```

### pushNamedAndRemoveUntil 删除之前页面并跳转新页面
```dart
IRouter.pushNamedAndRemoveUntil(Routes.page1, Routes.page2);
```