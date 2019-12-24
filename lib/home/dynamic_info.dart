import 'dart:async';

import 'package:flutter/material.dart';

class AnimateText extends AnimatedWidget {
  final String title;

  AnimateText({Key key, @required this.title, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: Transform.translate(
            offset: Offset(0.0, animation.value),
            child: Text(
              this.title, //infoArr[currIndex],
              softWrap: true,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 14),
            )));
  }
}

class DynamicInfo extends StatefulWidget {
  @override
  _DynamicInfoState createState() => _DynamicInfoState();
}

class _DynamicInfoState extends State<DynamicInfo>
    with SingleTickerProviderStateMixin {
  Timer _timer = null;
  int currIndex = 0;
  List<String> infoArr = [
    '1喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
    '2喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
    '3喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
    '4喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
    '5喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
    '6喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
    '7喜迎司庆，服务升级，谁是最优秀的服务顾问最优秀的服务顾问',
  ];
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    currIndex = 0;
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
//    final CurvedAnimation curve =
//        new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = new Tween(begin: -60.0, end: 0.0).animate(controller);

//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        controller.reverse();
//      } else if (status == AnimationStatus.dismissed) {
//        controller.forward();
//      }
//    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (_timer == null) {
      Duration _duration = const Duration(seconds: 2);
      _timer = Timer.periodic(_duration, (Void) {
        currIndex++;
        if (currIndex == infoArr.length) currIndex = 0;
        setState(() {
          currIndex = currIndex;
        });
      });
    }

    return Container(
      alignment: Alignment.center,
      padding: new EdgeInsets.all(8.0),
      color: Colors.white,
      constraints: BoxConstraints(),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Image(
              image: AssetImage('image/icon04.png'),
              width: 40,
            ),
          ),
          Expanded(
              flex: 1,
              child: AnimateText(
                animation: animation,
                title: infoArr[currIndex],
              )),
          GestureDetector(
            child: Text(
              '更多>',
              style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  color: Colors.grey),
            ),
            onTap: () {
              print('more');
            },
          ),
        ],
      ),
    );
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    cancelTimer();
    controller.dispose();
    // 相当于dealloc
    super.dispose();
  }
}
