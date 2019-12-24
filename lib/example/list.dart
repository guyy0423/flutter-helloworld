import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'myapp',
//      debugShowCheckedModeBanner: false,
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyStatelessWidget(),
//    );
//  }
//}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 27, 33, .8),
        title: Text("list test"),
      ),
      body: GridPage()
    );
  }
}

Dio dio = new Dio();

class GridPage extends StatefulWidget {
  @override
  GridPageState createState() => new GridPageState();
}

class GridPageState extends State<GridPage> with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = new ScrollController();

  int _page = 0;
  int _size = 10;
  int _beLoad = 0; // 0表示不显示, 1表示正在请求, 2表示没有更多数据

  var posts = [];
  @override
  void initState() {
    super.initState();
    // 首次拉取数据
    _getPostData(true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _addMoreData();
        print('我监听到底部了!');
      }
    });
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
          itemBuilder: (context, index) => TileCard(
            img: '${posts[index]['images']}',
            title: '${posts[index]['title']}',
            author: '${posts[index]['userName']}',
            authorUrl: '${posts[index]['iconUrl']}',
            type: '${posts[index]['type']}',
          ),
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
//    var response = await dio.get(
//        'https://xxxxx.com/getdata?page=$_page&size=$_size');
//    var result = response.data;
//    print('result: ${result['data']}');
    setState(() {
      if (!_beAdd) {
        posts.clear();
        posts = [
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "2aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "3aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "4aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "5aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "6aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "7aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "8aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "9aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "10aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "11aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "12aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "13aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "14aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "15aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "16aaaaaaaa",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          }
        ]; //result['data'];
      } else {
        posts.addAll([
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "2bbbbbbb2bbbbbbb2bbbbbbb2bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "3bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "4bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "5bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "6bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "7bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "8bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "9bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "10bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          {
            "images": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "title": "11bbbbbbb",
            "userName": "bbbbbb",
            "iconUrl": "https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
            "type": "EXISE",
            "worksAspectRatio": ""
          },
          //{
//          "images":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "title":"12bbbbbbb",
//          "userName":"bbbbbb",
//          "iconUrl":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "type":"EXISE",
//          "worksAspectRatio":""
//        },{
//          "images":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "title":"13bbbbbbb",
//          "userName":"bbbbbb",
//          "iconUrl":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "type":"EXISE",
//          "worksAspectRatio":""
//        },{
//          "images":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "title":"14bbbbbbb",
//          "userName":"bbbbbb",
//          "iconUrl":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "type":"EXISE",
//          "worksAspectRatio":""
//        },{
//          "images":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "title":"15bbbbbbb",
//          "userName":"bbbbbb",
//          "iconUrl":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "type":"EXISE",
//          "worksAspectRatio":""
//        },{
//          "images":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "title":"16bbbbbbb",
//          "userName":"bbbbbb",
//          "iconUrl":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "type":"EXISE",
//          "worksAspectRatio":""
//        },{
//          "images":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "title":"17bbbbbbb",
//          "userName":"bbbbbb",
//          "iconUrl":"https://avatar.csdnimg.cn/E/E/8/3_qq_37105358.jpg",
//          "type":"EXISE",
//          "worksAspectRatio":""
//        }
        ]);
      }
    });
  }
}

//---------------------------------------------------
class TileCard extends StatelessWidget {
  final String img;
  final String title;
  final String author;
  final String authorUrl;
  final String type;
  final double worksAspectRatio;
  TileCard(
      {this.img,
      this.title,
      this.author,
      this.authorUrl,
      this.type,
      this.worksAspectRatio});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            child: CachedNetworkImage(imageUrl: '$img'),
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                bottom: ScreenUtil().setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('$authorUrl'),
                  radius: ScreenUtil().setWidth(30),
                  // maxRadius: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  width: ScreenUtil().setWidth(250),
                  child: Text(
                    '$author',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(80)),
                  child: Text(
                    '${type == 'EXISE' ? '练习' : '其他'}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(25),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
