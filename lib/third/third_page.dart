
import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

class ThirdPage extends StatefulWidget {
  String title;
  ThirdPage({Key key, this.title}) : super(key: key);
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
//   String title;
  @override
  void initState() {
    print('init${widget.title}');
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
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(29, 27, 33, .8),
        title: Text('第三个页面${widget.title}'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {

            },
          ),
        ],
      ),

      body: Container(
        child: Text('我是第三个页面'),
      ),
    );
  }
}

