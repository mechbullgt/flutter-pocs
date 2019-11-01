import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key key}) : super(key: key);
  @override
  _FuturePageState createState() => new _FuturePageState();
}

class _FuturePageState extends State<FuturePage>{
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
            Text("Future Page")
          ],
        ),
      ),
    );
  }
}