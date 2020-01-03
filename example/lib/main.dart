/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 16:24:05
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-03 17:59:39
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
    return MaterialApp(
      navigatorKey: InnRouter.navKey,
      home: Scaffold(
        backgroundColor: Color(0xFF25272a),
        appBar: AppBar(
          title: const Text('Inn Router'),
          elevation: 0,
          backgroundColor: Color(0xFF25272a),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(30),
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.4,
          ),
          itemCount: lists.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () => InnRouter.push(lists[i]),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF25272a),
                  boxShadow: [
                    BoxShadow(color: Color(0xff17181a), offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(lists[i].title, style: TextStyle(fontSize: 22, color: Color(0xFFaaaaaa))),
              ),
            );
          },
        ),
      ),
    );
  }
}

List<InnRouterClass> lists = [
  Routes.cupertino(),
  Routes.material(),
];
