import 'package:flutter/material.dart';

import 'banners.dart';
import 'functional_categories.dart';
import 'dynamic_info.dart';
import 'recommend.dart';

//首页
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        MySwiperPage(),
        FunctionalNavigation(),
        DynamicInfo(),
        Recommend(),
      ],
    );
  }
}
