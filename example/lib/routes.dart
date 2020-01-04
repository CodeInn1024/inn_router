/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 17:05:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-04 17:57:29
*/

import './page1.dart';
import 'package:inn_router/inn_router.dart';

class Routes {
  static String path = "/router";
  static InnRouterClass page1({String text, Function button}) => InnRouterClass(widget: Page1(text: text, button: button, title: "第一层"), path: "$path/page1");
  static InnRouterClass page2({String text, Function button}) => InnRouterClass(widget: Page1(text: text, button: button, title: "第二层"), path: "$path/page2");
  static InnRouterClass page3({String text, Function button}) => InnRouterClass(widget: Page1(text: text, button: button, title: "第三层"), path: "$path/page3");
  static InnRouterClass page4({String text, Function button}) => InnRouterClass(widget: Page1(text: text, button: button, title: "第四层"), path: "$path/page4");

  static InnRouterClass get cupertino => InnRouterClass(widget: Page1(), path: "$path/cupertino", title: "cupertino");
  static InnRouterClass get material => InnRouterClass(widget: Page1(), path: "$path/material", title: "material", transition: InnRouterTransition.material);
  static InnRouterClass parameter(String text) => InnRouterClass(widget: Page1(text: text), path: "$path/parameter", title: "传参");
  static InnRouterClass get authority => InnRouterClass(widget: Page1(title: "权限"), path: "$path/authority", roles: ["root"], title: "权限");
  static InnRouterClass popUntil({String text, Function button}) => InnRouterClass(widget: Page1(title: "popUntil", button: button), path: "$path/popUntil", title: "popUntil");
  static InnRouterClass pushReplacementNamed({String text, Function button}) => InnRouterClass(
        widget: Page1(text: text, button: button, title: "第一层"),
        path: "$path/pushReplacementNamed",
        title: "pushReplacementNamed",
      );
  static InnRouterClass popAndPushNamed({String text, Function button}) => InnRouterClass(
        widget: Page1(text: text, button: button, title: "第一层"),
        path: "$path/popAndPushNamed",
        title: "popAndPushNamed",
      );
  static InnRouterClass pushNamedAndRemoveUntil({String text, Function button}) => InnRouterClass(
        widget: Page1(text: text, button: button, title: "第一层"),
        path: "$path/pushNamedAndRemoveUntil",
        title: "pushNamedAndRemoveUntil",
      );
}
