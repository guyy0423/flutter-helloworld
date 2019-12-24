import 'package:flutter/material.dart';
import 'pay_success.dart';

class PayConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          //普通路由跳转
          Navigator.pushNamed(context, '/router/screen4');
          //跳转路由4的同时，要将2,3移除掉 ，重置栈中页面底线
//          Navigator.of(context).pushAndRemoveUntil(
//              MaterialPageRoute(builder: (context) => PaySuccess()),
//              ModalRoute.withName('/router/screen1')
//          );
//          Navigator.of(context).pushNamedAndRemoveUntil(
//              "/router/screen4", ModalRoute.withName("/router/screen1"));

//          Navigator.of(context).pushAndRemoveUntil(
//              MaterialPageRoute(builder: (context) => PaySuccess()),
//              ModalRoute.withName('/router/screen1'));
        },
        child: Text(
          'screen3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
