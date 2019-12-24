import 'package:flutter/material.dart';
import 'selection_screen.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
//   String title;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(29, 27, 33, .8),
        title: Text('第四个页面'),
      ),
      body: Column(children: <Widget>[Text('我是第四个页面'), RaiseMyButton()]),
    );
  }
}

class RaiseMyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _navigateAndDisplaySelection(context);
          },
          child: Text('Pick an option, any option!'),
        ),
      ],
    );
  }

  //点击跳转到SelectionScreen并接收返回值
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.

//调用Navigator.push()会返回一个Furture，根据这个Future可以接收页面返回的参数，这个下面再讲
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    String value = result as String;
    print(value);
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$value")));
  }
}
