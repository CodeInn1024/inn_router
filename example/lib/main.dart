/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 16:24:05
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-04 18:01:16
*/

import './common.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InnRouter.roles = ["admin"];
    return MaterialApp(
      navigatorKey: InnRouter.navKey,
      onGenerateRoute: InnRouter.onGenerateRoute,
      home: Scaffold(
        backgroundColor: Color(0xFF25272a),
        appBar: AppBar(
          title: Text('Inn Router'),
          elevation: 0,
          backgroundColor: Color(0xFF25272a),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(30),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.4,
          ),
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                InnRouter.push(lists[i]);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF25272a),
                  boxShadow: [
                    BoxShadow(color: Color(0xff17181a), offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(lists[i].title, textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Color(0xFFaaaaaa))),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<InnRouterClass> lists = [
  Routes.cupertino,
  Routes.material,
  Routes.authority,
  Routes.parameter("我是参数"),
  Routes.pushReplacementNamed(text: "把第一层替换为第二层", button: () => InnRouter.pushReplacementNamed(Routes.page2())),
  Routes.popUntil(text: "跳转到第二层", button: () => InnRouter.popUntil(Routes.popUntil())),
  Routes.popAndPushNamed(text: "返回并跳转第二层", button: () => InnRouter.popAndPushNamed(Routes.page2())),
  Routes.pushNamedAndRemoveUntil(
    text: "跳转第二层",
    button: () => InnRouter.push(Routes.page2(
      text: "跳转第三层",
      button: () => InnRouter.push(Routes.page3(
        text: "返回到第一层并跳转到第四层",
        button: () => InnRouter.pushNamedAndRemoveUntil(Routes.page4(), Routes.pushNamedAndRemoveUntil()),
      )),
    )),
  ),
];
