
import 'package:flutter/material.dart';
import 'package:hello_world/third/third_page.dart';
import 'package:hello_world/fourth/fourth_page.dart';
import '../home/model.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class SecondPage extends StatelessWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
          onPressed: (){
            Navigator.of(context).pop('传回首页的参数');
          },
        ),
        backgroundColor: Color.fromRGBO(29, 27, 33, .8),
        title: Text('第二个页面${args.title}'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add',
          ),
        ],
      ),

      body: Container(
        child:Column (
          children: <Widget>[
            Text('我是第二个页面${args.message}'),
            FlatButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (_) => ThirdPage(title: '路由是个好东西，要进一步封装')));
              },
                child: new Text("跳转第三个页面传参并返回值")
            ),
            FlatButton(
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (_) => FourthPage()));
                },
                child: new Text("跳转第四个页面传参并返回值")
            ),
          ],
        )
      ),
    );
  }
}
