import 'package:flutter/material.dart';

import 'home/product_list.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下拉刷新报错
//    return ListView(
//        primary:false,
//        physics:NeverScrollableScrollPhysics(),
//      children: <Widget>[
//        TabbedBarCategory()
//      ],
//    );
    return GridPage();
  }
}
