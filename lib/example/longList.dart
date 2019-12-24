import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(new MyApp(
    items: new List<String>.generate(20, (i) => "我们都是一家 Item $i"),
  ));
}
const textStyle = const TextStyle(
  fontFamily: 'SourceHanSansCN-Bold',
);

class MyApp extends StatelessWidget {
  final List<String> items;
  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            //普通listitem
//            return new ListTile(
//              title: new Text('${items[index]}'),
//            );
            final item = items[index];
            //可滑动删除的 listitem
            return new Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify Widgets.
              key: new Key(item),
              // We also need to provide a function that will tell our app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                items.removeAt(index);

                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("$item dismissed")));
              },
              // Show a red background as the item is swiped away
              background: new Container(color: Colors.red),
              child: new ListTile(title: new Text('$item', style: textStyle,)),
            );
          },
        ),
      ),
    );
  }
}

