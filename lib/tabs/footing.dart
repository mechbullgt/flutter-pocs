import 'package:flutter/material.dart';

class Footing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
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