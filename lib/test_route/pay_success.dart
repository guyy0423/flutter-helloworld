import 'package:flutter/material.dart';

class PaySuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          //当前在Screen4页面，点击回到Screen1，连带着Screen2，Screen3也一起退出
          Navigator.of(context).popUntil(ModalRoute.withName('/router/screen1'));
      },
        child: Text(
          'screen4',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
