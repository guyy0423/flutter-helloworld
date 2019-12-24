import 'package:flutter/material.dart';
import 'package:hello_world/third/third_page.dart';

import 'message_page.dart';
import 'main_center.dart';
import 'second/second_page.dart';
import 'third/third_page.dart';
import 'test_route/product_detail.dart';
import 'test_route/pay.dart';
import 'test_route/pay_confirm.dart';
import 'test_route/pay_success.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myapp',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatelessWidget(),// 定义APP启动时第一个显示的页面，在本例中，initialRoute指代FirstScreen
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        // 这里可以定义静态路由，不能传递参数
        '/router/second': (context) => new SecondPage(),
        '/router/third': (context) => new ThirdPage(),
        '/router/screen1': (context) => ProductDetail(),
        '/router/screen2': (context) => Pay(),
        '/router/screen3': (context) => PayConfirm(),
        '/router/screen4': (context) => PaySuccess(),
      },
    );
  }
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
//以下appBar相关
appBarLeading() {
  return new IconButton(
    icon: Image(image: AssetImage("image/logo.png")),
    tooltip: 'Navigation menu',
    onPressed: null,
  );
}
appBarTitle() {
  final TextEditingController _controller = new TextEditingController();
  return new TextField(
    controller: _controller,
    decoration: new InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: '产品、计划书', //placeholder
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        )
    ),
    maxLines: 1, //最大行数
    autocorrect: true, //是否自动更正
    obscureText: false, //是否是密码
    textAlign: TextAlign.left, //文本对齐方式
    style: TextStyle(fontSize: 14.0, color: Colors.black54), //输入文本的样式
    onChanged: (text) {
      //内容改变的回调
      print('change $text');
    },
    onSubmitted: (text) {
      //内容提交(按回车)的回调
      print('submit $text');
    },
//          enabled: false,//是否禁用
  );
}
appBarActions(BuildContext context) {
  return <Widget>[
    IconButton(
      icon: const Icon(Icons.add_alert),
      tooltip: 'Show Snackbar',
      onPressed: () {
        scaffoldKey.currentState.showSnackBar(snackBar);
      },
    ),
    IconButton(
      icon: const Icon(Icons.message),
      tooltip: 'Next page',
      onPressed: () {
        openPage(context);
      },
    ),
  ];
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 27, 33, .8),
        leading: appBarLeading(),
        title: appBarTitle(),
        actions: appBarActions(context),
      ),
      body: MainCenter(),
    );
  }
}


void openPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Message();
    },
  ));
}
