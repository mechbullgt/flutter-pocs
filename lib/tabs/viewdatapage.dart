import 'package:flutter/material.dart';

class ViewDataPage extends StatefulWidget {
  const ViewDataPage({Key key}) : super(key: key);
  @override
  _ViewDataPageState createState() => new _ViewDataPageState();
}

class _ViewDataPageState extends State<ViewDataPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.border_clear,
              size: 160.0,
              color: Colors.black,
            ),
            Text("Footing Tab")
          ],
        ),
      ),
    );
  }
}