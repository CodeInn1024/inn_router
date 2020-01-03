/*
 * @Description: 
 * @Version: 1.0
 * @Autor: lqrui.cn
 * @Date: 2020-01-03 17:10:53
 * @LastEditors: lqrui.cn
 * @LastEditTime: 2020-01-03 18:00:28
*/

import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25272a),
      appBar: AppBar(
        title: const Text('Inn Router'),
        elevation: 0,
        backgroundColor: Color(0xFF25272a),
        centerTitle: true,
      ),
    );
  }
}
