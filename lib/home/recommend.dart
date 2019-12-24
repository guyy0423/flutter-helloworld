import 'package:flutter/material.dart';
import 'model.dart';
import '../second/second_page.dart';
import '../browser/browser.dart';

class Info {
  const Info({this.icon, this.title, this.description, this.btnName});
  final Image icon;
  final String title;
  final String description;
  final String btnName;
}

const List<Info> recommendInfos = <Info>[
  Info(
      icon: Image(image: AssetImage("image/recommend01.png")),
      title: '药无忧 抗癌特药险',
      description: '54种特效支持更新，保障确疹后5年用药，保障确疹后5年用药',
      btnName: '点击兑换'),
  Info(
      icon: Image(image: AssetImage("image/recommend02.png")),
      title: '跨年出游季',
      description: '出行必备旅游险帮助你一站配齐',
      btnName: '查看专题'),
  Info(
      icon: Image(image: AssetImage("image/recommend03.png")),
      title: '浙商个人综合意外险',
      description: '海陆空交通意外全覆盖意外医疗与住院津贴',
      btnName: '查看产品')
];

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        verticalDirection: VerticalDirection.up,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: recommendInfos.map<Widget>((Info info) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 2.0),
              child: RecommendCard(info: info),
            ),
//            flex: 1,
          );
        }).toList(),
      ),
    );
  }
}

class RecommendCard extends StatelessWidget {
  const RecommendCard({Key key, this.info}) : super(key: key);
  final Info info;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('test-${info.btnName}');
          if (info.btnName == '点击兑换') {
            print('静态路由跳转第二页');
            //方式一
//            Navigator.pushNamed(context, '/router/second', arguments: ScreenArguments('参数：二标题', '参数:二内容')).then((value) => {
//              print(value)
//            });
            //方式二
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
                settings: RouteSettings(
                  arguments: ScreenArguments(
                    '参数：二标题',
                    '参数:二内容.',
                  ),
                ),
              ),
            ).then((value) => print(value));
          } else if(info.btnName == '查看专题') {
            Navigator.pushNamed(context, "/router/screen1");
          } else if(info.btnName == '查看产品') {
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return new Browser(
                url: "https://flutter-io.cn/",
                title: "Flutter 中文社区"
              );
            }));
          }
        },
        child: Card(
          elevation: 15.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))), //设置圆角
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                info.icon,
                Text(
                  info.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    info.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      info.btnName,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ),
        ));
  }
}
