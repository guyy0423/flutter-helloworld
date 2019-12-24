import 'package:flutter/material.dart';

class Pay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/router/screen3');
        },
        child: Text(
          'screen2',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
