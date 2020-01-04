/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 17:10:53
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-04 10:15:31
*/

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String text;
  final String title;
  final Function button;
  const Page1({Key key, this.text, this.button, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25272a),
      appBar: AppBar(
        title: Text(title ?? "page1"),
        elevation: 0,
        backgroundColor: Color(0xFF25272a),
        centerTitle: true,
      ),
      body: Center(
        child: button == null
            ? Text(text ?? "", style: TextStyle(color: Colors.white))
            : FlatButton(
                child: Text(text ?? "请点击"),
                onPressed: button,
                color: Colors.blueAccent,
              ),
      ),
    );
  }
}
