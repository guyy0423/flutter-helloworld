import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hello_world/http/http_util.dart';
import 'product_card.dart';
import 'dart:convert' as convert;

HttpUtil httpUtil = new HttpUtil();

class TabbedBarCategory extends StatefulWidget {
  @override
  _TabbedBarCategoryState createState() => _TabbedBarCategoryState();
}

class _TabbedBarCategoryState extends State<TabbedBarCategory>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int currIndex;
  int previousIndex;
  @override
  void initState() {
    super.initState();
    print('初始化 数据...'); // 全部/计划书/新品/推荐/收藏  "您还没有任何收藏，快去逛逛吧～"
    _tabController = new TabController(
        vsync: this, //固定写法
        length: 5 //指定tab长度
        );
    _tabController.addListener(() {
      var index = _tabController.index;
      var previousIndex = _tabController.previousIndex;
      if (_tabController.indexIsChanging) {
        setState(() {
          currIndex = index;
          previousIndex = previousIndex;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepOrange,
            indicatorPadding:
                EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0),
            indicatorWeight: 3.0,
            labelStyle: TextStyle(fontSize: 18.0),
            tabs: <Widget>[
              Text('全部'),
              Text('计划书'),
              Text('新品'),
              Text('推荐'),
              Text('收藏'),
//              _tabBarItem("全部"),
            ]),
//        productList(currIndex, previousIndex: previousIndex)
        GridPage()
      ],
    );
  }
}

Widget productList(int currIndex, {int previousIndex}) {
  print('当前分类${currIndex}');
  return new GridPage();
}

class GridPage extends StatefulWidget {
//  final int currIndex;
//  GridPage(this.currIndex);
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();

  int _page = 0;
  int _size = 10;
  int _beLoad = 0; // 0表示不显示, 1表示正在请求, 2表示没有更多数据
  var posts = [];
  @override
  void initState() {
    // 首次拉取数据
    _getPostData(true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _addMoreData();
        print('我监听到底部了!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Container(
        color: Colors.grey[100],
        child: StaggeredGridView.countBuilder(
          controller: _scrollController,
          itemCount: posts.length,
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) => TileCard(
              icon: '${posts[index]['icon']}',
              title: '${posts[index]['title']}',
              tags: [],
              insureAge: '${posts[index]['insureAge']}',
              ensureYear: '${posts[index]['ensureYear']}',
              prem: 0),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

// 下拉刷新数据
  Future<Null> _refreshData() async {
    _page = 0;
    _getPostData(false);
  }

// 上拉加载数据
  Future<Null> _addMoreData() async {
    _page++;
    _getPostData(true);
  }

  void _getPostData(bool _beAdd) async {

    var reqData = {"page": _page, "size": _size};

    var result = await httpUtil.post('http://127.0.0.1:8800/getBanner', data:reqData);
    result = convert.jsonDecode(result);
    if(!_beAdd || _page == 0) {
      posts.clear();
      posts = result['data'];
    }else{
      posts.addAll(result['data']);
    }
    setState(() {
    });
  }
  cancel () {
    print('触发cancel。。。');
  }
}

// 暂无用
Widget _tabBarItem(String title, {bool showRightImage = true}) {
  return Tab(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Expanded(
        child: Center(
          child: Text(title),
        ),
      ),

      ///分割符自定义，可以放任何widget
      showRightImage
          ? Text('|',
              style: TextStyle(
                color: Color(0xffd0d0d0),
              ))
          : Text(' ',
              style: TextStyle(
                color: Color(0xffd0d0d0),
              ))
    ],
  ));
}
