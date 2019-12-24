import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
//
void main() =>
  runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = "custom themes";
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.red[600],
      ),
      home: new MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image:
          'http://static.ycbrokers.com/resource/pc/index/banner1.jpeg',
        ),
//        child: new CachedNetworkImage(
//          placeholder: new CircularProgressIndicator(),
//          imageUrl:
//          'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//        ),
//        child: new Container(
//          color: Theme.of(context).accentColor,
//          child: new Text(
//            'Text with a background color2',
//            style: Theme.of(context).textTheme.title,
//          ),
//        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(),
        child: new FloatingActionButton(
          onPressed: (){print('click me');},
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}


// 自适应
//  Widget build(BuildContext context) {
//    return new Container(
//      child: new Container(
//        color: Colors.blueGrey,
//        height: 200.0,
//        width: 200.0,
//        child: new FractionallySizedBox(
//          alignment: Alignment.topLeft, //元素左上角对齐
//          widthFactor: 0.5, //宽度因子
////          heightFactor: 0.5, //高度因子
//          child: new Container(
//            color: Colors.green,
//          ),
//        ),
//      ),
//    );
//  }
//}

//return Container(
//child: Image.asset('images/icon01.png'),
//);
