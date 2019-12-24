import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home/home_page.dart';
import 'explore_page.dart';
import 'category_page.dart';
import 'mine_page.dart';

class MainCenter extends StatefulWidget {
  @override
  _MainCenterState createState() => _MainCenterState();
}

class _MainCenterState extends State<MainCenter> {
  var _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '订单', '产品库', '个人中心'];
  var _pageList;

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              fontSize: 14.0, color: Color.fromRGBO(29, 27, 33, .8)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(
              fontSize: 14.0, color: Color.fromRGBO(29, 27, 33, .8)));
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('image/home.png'), getTabImage('image/home-active.png')],
      [
        getTabImage('image/explore.png'),
        getTabImage('image/explore-active.png')
      ],
      [
        getTabImage('image/category.png'),
        getTabImage('image/category-active.png')
      ],
      [getTabImage('image/me.png'), getTabImage('image/me-active.png')]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new ExplorePage(),
      new CategoryPage(),
      new MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
        body: _pageList[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          type: BottomNavigationBarType.fixed,
          //默认选中首页
          currentIndex: _tabIndex,
          iconSize: 24.0,
          //点击事件
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }
}

//class MainCenter extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
//          return <Widget>[
//            SliverAppBar(
//              //展开高度
//              expandedHeight: 150.0,
//              //是否随着滑动隐藏标题
//              floating: false,
//              //是否固定在顶部
//              pinned: true,
//              //可折叠的应用栏
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text(
//                  'Banner1',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                ),
//                background: Image.network(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549129578802&di=f866c638ea12ad13c5d603bcc008a6c2&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F07%2F66%2F16pic_766297_b.jpg',
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//            SliverAppBar(
//              //展开高度
//              expandedHeight: 150.0,
//              //是否随着滑动隐藏标题
//              floating: false,
//              //是否固定在顶部
//              pinned: true,
//              //可折叠的应用栏
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text(
//                  'Banner2',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                ),
//                background: Image.network(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549129578802&di=f866c638ea12ad13c5d603bcc008a6c2&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F07%2F66%2F16pic_766297_b.jpg',
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//            SliverAppBar(
//              //展开高度
//              expandedHeight: 150.0,
//              //是否随着滑动隐藏标题
//              floating: false,
//              //是否固定在顶部
//              pinned: true,
//              //可折叠的应用栏
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text(
//                  'Banner3',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                ),
//                background: Image.network(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549129578802&di=f866c638ea12ad13c5d603bcc008a6c2&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F07%2F66%2F16pic_766297_b.jpg',
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//            SliverAppBar(
//              //展开高度
//              expandedHeight: 150.0,
//              //是否随着滑动隐藏标题
//              floating: false,
//              //是否固定在顶部
//              pinned: true,
//              //可折叠的应用栏
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text(
//                  'Banner4',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16.0,
//                  ),
//                ),
//                background: Image.network(
//                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1549129578802&di=f866c638ea12ad13c5d603bcc008a6c2&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F07%2F66%2F16pic_766297_b.jpg',
//                  fit: BoxFit.cover,
//                ),
//              ),
//            ),
//          ];
//        },
//        body: Center(
//          child: Text('向上提拉，查看效果'),
//        )
//    );
//  }
//}

//child: Image(
//image: AssetImage("image/icon01.png"),
//),
