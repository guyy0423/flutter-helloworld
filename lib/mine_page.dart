import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    onPressed: (){
                      print('click');
                    },
                    child: Image(image: AssetImage('image/me.png'), width: 40, height:40),
                    color: Color.fromRGBO(0, 0, 0, 0.0),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[Text("昵称"), Text("微信号: yy3402244")],
                    ),
                  ),
                )
              ],
            ),
            Text('body....')
          ],
    ));
  }
}
