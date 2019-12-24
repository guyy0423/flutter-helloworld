import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 800,
        padding: EdgeInsets.all(50.0),
        child: Column(

          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              child: Text(
                '点击返回',
                style: TextStyle(fontSize: 30),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/router/screen2');
              },
              child: Text(
                'screen1',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        )
    );
  }
}
