import 'package:flutter/material.dart';
import 'mock_data.dart';

class FunctionalNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(8.0),
      height: 180,
      decoration: BoxDecoration(
//        color: Colors.black12
      ),
      child: new ServiceCategories()
    );
  }
}
class ServiceCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      physics: const NeverScrollableScrollPhysics(), //禁止滑动
      padding: EdgeInsets.symmetric(vertical: 0),
      children: serviceList.map((item) => ServiceItem(data: item)).toList(),
    );
  }
}

Widget getItemContainer(item) {
  return Container(
    width: 5.0,
    height: 5.0,
    alignment: Alignment.center,
    child: Text(
      item,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    color: Colors.blue,
  );
}
class ServiceItem extends StatelessWidget {
  final ServiceItemViewModel data;
  ServiceItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Expanded(child: this.data.icon),
          Text(
            this.data.title,
            style: TextStyle(
              fontSize: 13,
              color: Color.fromRGBO(29, 27, 33, .8),
            )
          )
        ],
      ),
    );
  }
}
