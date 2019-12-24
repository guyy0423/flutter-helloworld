import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

final List<String> images = [
  'image/banner/banner01.png',
  'image/banner/banner02.png',
  'image/banner/banner03.png',
  'image/banner/banner04.png',
];

final List<String> descriptions = [
  '莲，出淤泥而不染',
  '社会我保姐，人美路子野',
  '周五快到了，准备追更新',
  '送你一辆奥迪',
];
class MySwiperPage extends StatefulWidget {
  @override
  _MySwiperPageState createState() => _MySwiperPageState();
}

class _MySwiperPageState extends State<MySwiperPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomeBanners()
      ],
    );
  }
}
class HomeBanners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: SizedBox.fromSize(
          size: Size.fromHeight(180.0),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                child: GestureDetector(
                  onTap: () {
                    _goOtherApp(index);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(images[index], fit: BoxFit.cover),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: images.length,
            //选中时的指示器
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.black38,
                  activeColor: Colors.white,
                ),
                margin: const EdgeInsets.only(bottom: 18.0)),
            control: null,
            duration: 300,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            scale: 0.92,
            autoplay: true,
            onTap: (int index) {
              Fluttertoast.showToast(msg: '点击了第$index个');
            },
          ),
        ));
  }
}
void _goOtherApp(int index) async {
  const url = 'https://www.baidu.com'; //这个url就是由scheme和host组成的 ：scheme://host
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
//Widget _swiperBuilder(BuildContext context, int index) {
//  return (Image.asset(
//    images[index],
//    fit: BoxFit.fill,
//  ));
//}