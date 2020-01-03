/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 17:05:54
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-03 17:59:19
*/

import './page1.dart';
import 'package:inn_router/inn_router.dart';

class Routes {
  static String path = "/router";
  static InnRouterClass cupertino() => InnRouterClass(widget: Page1(), path: "$path/page1", title: "cupertino");
  static InnRouterClass material() => InnRouterClass(widget: Page1(), path: "$path/page1", title: "material", transition: InnRouterTransition.material);
}
